class PostElement < ActiveRecord::Base
  attr_accessible :animation_direction, :animation_type, :element_id, :element_type, :element, :position, :post_id, :sequence

  belongs_to :element, polymorphic: true
  belongs_to :post

  validates_presence_of :element
  validates_inclusion_of :animation_type, in: ["scan"], allow_nil: true

  #position validation, examples are top: 2px; left; center; right; top; bottom; inline;

  #TODO: fill this in as we move along...
  def position_css
    #we handle different cases for sprites (which use background-image) and other display elements
    css_styles = {}
    css_styles[:position] = "absolute"

    position.split(";").each do |css_attribute|
      css_attribute.delete!(" ")

      if element_type == 'Sprite'
        case css_attribute
        when 'top'
        when 'bottom'
        when 'left'
        when 'right'
        when 'v-center'
        when 'h-center'
        when 'inline'
        else
          if /(left|right|top|bottom):(\d)*(px|%)/ =~ css_attribute
            attribute, value = css_attribute.split(":")
          end
        end

      else
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
          css_styles[:margin] = '0 auto'

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


    css_styles.to_a.map {|css_pair| "#{css_pair[0]}:#{css_pair[1]}"}
  end
end
