class PostElement < ActiveRecord::Base
  attr_accessible :animation_direction, :animation_type, :element_id, :element_type, :element, :position, :post_id, :sequence, :post

  belongs_to :element, polymorphic: true
  belongs_to :post

  validates_presence_of :element
  validates_inclusion_of :animation_type, in: %w[scan fixed], allow_nil: true

  #position validation, examples are top: 2px; left; center; right; top; bottom; inline;

  #TODO: Fill this in as we move along... This is gonna be a huge function, prolly needs to be better thought out at some point and needs unit tests like crazy
  def position_classes_and_css
    css_styles = {}
    classes = []
    positions = position.split(";").map {|position| position.delete(" ")}

    if element_type == 'Sprite'
      css_styles[:position] = animation_type || ["tiling", "cover"].include?(element.style) || positions.detect {|position| /(left|right|top|bottom)/.match(position) } ? "absolute" : "relative"

      y_val = '0%'
      x_val = '50%'

      positions.each do |css_attribute|
        case css_attribute
        when 'top'
          y_val = '0%'
        when 'bottom'
          y_val = '100%'
        when 'left'
          x_val = '0%'
        when 'right'
          x_val = '100%'
        when 'h-center'
          x_val = '50%'
        when 'v-center'
          y_val = '50%'
        when 'inline'
          css_styles[:position] = 'relative'
        else
          #TODO: handle right and bottom px and %
          if match = /left:((\d)*(px|%))/.match(css_attribute)
            x_val = match[1]
          elsif match = /top:((\d)*(px|%))/.match(css_attribute)
            y_val = match[1]
          end
        end
      end

      css_styles[:'background-position'] = "#{x_val} #{y_val}"

    else
      css_styles[:position] = positions.detect {|position| /(left|right|top|bottom)/.match(position) } ? "absolute" : "relative"

      positions.each do |css_attribute|
        case css_attribute
        when 'top'
          css_styles[:top] = '0px';
        when 'bottom'
          css_styles[:bottom] = '0px';
        when 'left'
          css_styles[:left] = '0px';
        when 'right'
          css_styles[:right] = '0px';
        when 'v-center'
        when 'h-center'
          if css_styles[:position] == "relative"
            css_styles[:margin] = '0 auto'
          else
            classes << "h-center"
          end
        when 'inline'
          css_styles[:position] = 'relative'
        else
          if /(left|right|top|bottom):(\d)*(px|%)/ =~ css_attribute
            attribute, value = css_attribute.split(":")
            css_styles[attribute.to_sym] = value
          end
        end
      end
    end

    [classes, css_styles.to_a.map {|css_pair| "#{css_pair[0]}:#{css_pair[1]}"}]
  end
end
