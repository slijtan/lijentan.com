class PostElement < ActiveRecord::Base
  attr_accessible :animation_direction, :animation_type, :element_id, :element_type, :element, :position, :post_id, :sequence, :post

  belongs_to :element, polymorphic: true, dependent: :destroy
  belongs_to :post

  validates_presence_of :element
  validates_inclusion_of :animation_type, in: %w[scan fixed fixed-scan three-phase], allow_nil: true

  #position validation, examples are top: 2px; left; center; right; top; bottom; inline;

  #TODO: Fill this in as we move along... This is gonna be a huge function, prolly needs to be better thought out at some point and needs unit tests like crazy
  def position_classes_and_css_and_data
    css_styles = {}
    classes = []
    data = {}
    positions = position.split(";").map {|position| position.delete(" ")}

    if element_type == 'Sprite'
      css_styles[:position] = animation_type || ["tiling", "cover"].include?(element.style) || positions.detect {|position| /(left|right|top|bottom|fluid)/.match(position) } ? "absolute" : "relative"
      x_val = '50%'
      y_val = '0%'

      positions.each do |css_attribute|
        case css_attribute
        when 'inline'
          css_styles[:position] = 'relative'
        else
          #TODO: handle right and bottom px and %
          if match = /fixed-left:(\d*px)/.match(css_attribute)
            x_val = match[1]

          elsif match = /fixed-top:(\d*px)/.match(css_attribute)
            y_val = match[1]

          elsif match = /(fixed-(right|bottom)):(\d*)px/.match(css_attribute)
            attribute = match[1]
            value = match[3]
            classes << attribute
            data[attribute.to_sym] = value

          elsif match = /(fixed-grid-(left|right)):(-?\d*)cols?/.match(css_attribute)
            attribute = match[1]
            value = match[3]
            classes << attribute
            data[attribute.to_sym] = value

          elsif match = /fluid-h:(\d*%)/.match(css_attribute)
            x_val = match[1]

          elsif match = /fluid-v:(\d*%)/.match(css_attribute)
            y_val = match[1]
          end
        end
      end

      css_styles[:'background-position'] = "#{x_val} #{y_val}"

    else
      css_styles[:position] = positions.detect {|position| /(left|right|top|bottom|fluid-h|fluid-v)/.match(position) } ? "absolute" : "relative"

      positions.each do |css_attribute|
        case css_attribute
        when 'inline'
          css_styles[:position] = 'relative'
        else
          if match = /fixed-(left|right|top|bottom):(\d*px)/.match(css_attribute)
            attribute = match[1]
            value = match[2]
            css_styles[attribute.to_sym] = value

          elsif match = /(fluid-h|fluid-v):(\d*)%/.match(css_attribute)
            attribute = match[1]
            value = match[2]
            classes << attribute
            data[attribute.to_sym] = value

          elsif match = /(fixed-grid-(left|right)):(-?\d*)cols?/.match(css_attribute)
            attribute = match[1]
            value = match[3]
            classes << attribute
            data[attribute.to_sym] = value

          end
        end
      end
    end

    [classes, css_styles.to_a.map {|css_pair| "#{css_pair[0]}:#{css_pair[1]}"}, data]
  end

  def three_phase_initial
    animation_direction.split("-").first
  end
end
