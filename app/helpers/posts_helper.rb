module PostsHelper

  def render_post_element(post_element)
    render partial: post_element.element_type.underscore, locals: {post_element: post_element}
  end

  #TODO refactor the attribute functions a bit
  def sprite_attributes(post_element)
    sprite = post_element.element

    classes = []
    classes << "sprite"
    classes << sprite.style
    classes << post_element.animation_type if post_element.animation_type

    data = {}
    data["animation-direction"] = post_element.animation_direction if post_element.animation_direction

    styles = []
    styles << "background: url(#{ asset_path(sprite.url) })"
    styles.concat(post_element.position_css)

    html_classes = "class=\"#{classes.join(" ")}\""
    html_data = data.to_a.inject("") {|res, hash_key_val| res += "data-#{hash_key_val[0]}=\"#{hash_key_val[1]}\""}
    html_styles = "style=\"#{styles.join(";")}\""

    raw("#{html_classes} #{html_styles} #{html_data}")
  end

  def text_box_attributes(post_element)
    text_box = post_element.element

    classes = []
    classes << "text-box"
    classes << text_box.style
    classes << post_element.animation_type if post_element.animation_type

    data = {}
    data["animation-direction"] = post_element.animation_direction if post_element.animation_direction

    styles = []
    styles << "font-size:#{text_box.text_size}px" if text_box.text_size
    styles.concat(post_element.position_css)

    html_classes = "class=\"#{classes.join(" ")}\""
    html_data = data.to_a.inject("") {|res, hash_key_val| res += "data-#{hash_key_val[0]}=\"#{hash_key_val[1]}\""}
    html_styles = "style=\"#{styles.join(";")}\""

    raw("#{html_classes} #{html_styles} #{html_data}")
  end

  def post_class_and_style(post)
    classes = []

    if post.space == "auto"
      space = cycle(*spaces, name: "space")
      logger.debug("space is auto #{space}")
    else
      space = post.space
      logger.debug("space is set #{space}")
      skip_to_cycle(post.space, spaces, "space")
    end

    classes << space
    classes << post.effect unless post.effect.blank?

    html_classes = "class=\"#{classes.join(" ")}\""

    styles = []
    bg_urls = []
    bg_urls << bg_urls_for_space(space)

    styles << "background-color: #{post.bg_color}" unless post.bg_color.blank?
    styles << "height: #{post.height}" unless post.height.blank?

    html_styles = "style=\"#{styles.join(";")}\"" unless styles.empty?

    raw("#{html_classes} #{html_styles}")
  end


  ########################################
  ######## BEGIN OLD #####################
  ########################################

  def spaces
    ['midground', 'foreground', 'background']
  end


  def quote_class_and_style(quote)
    html_classes = "class=\"#{quote.type}\""

    styles = []
    styles << "font-size:#{quote.text_size}px" unless quote.text_size.blank?
    styles << "color:#{quote.text_color}" unless quote.text_color.blank?

    unless styles.empty?
      html_styles = "style=\"#{styles.join(";")}\""
    end

    raw("#{html_classes} #{html_styles}")
  end

  def image_class_and_style(image)
    @image_index ||= {}
    index = (@image_index[image.post_id] ||= 0)

    styles = []

    if image.post.is_album_comic? && post_data = Post.album_comic_data_for_index(index)
      styles << "top: #{post_data[:top]}px"
      styles << "left: #{post_data[:left]}px"
      styles << "width: #{post_data[:width]}px"
      styles << "height: #{post_data[:height]}px"
      styles << "z-index: #{post_data[:z_index]}"
    end

    @image_index[image.post_id] += 1

    html_styles = "style=\"#{styles.join(";")}\""
    raw(html_styles)
  end

  def skip_to_cycle(set_to, cycle_values, cycle_name)
    until current_cycle(cycle_name) == set_to
      logger.debug("cycling to #{current_cycle(cycle_name)}")
      cycle(*cycle_values, :name => cycle_name)
    end

    logger.debug("cycle at #{current_cycle(cycle_name)}")
  end

  private

  def bg_urls_for_space(space)
    case space
    when 'foreground'
      return "url(#{ asset_path 'layout/divider-foreground-top.png' }) repeat-x scroll center top", "url(#{ asset_path 'layout/divider-foreground-bottom.png' }) repeat-x scroll center bottom"
    when 'midground'
      return "url(#{ asset_path 'layout/divider-midground-top.png' }) repeat-x scroll center top", "url(#{ asset_path 'layout/divider-midground-bottom.png' }) repeat-x scroll center bottom"
    when 'background'
      return "url(#{ asset_path 'layout/divider-background-top.png' }) repeat-x scroll center top", "url(#{ asset_path 'layout/divider-background-bottom.png' }) repeat-x scroll center bottom"
    end

  end

=begin
  def background_class(post)
    post.background_images.empty? ? "bg-none" : (["bg"] << post.background_images.map {|image| image.type }).join("-")
  end

  def background_css(post)
    post.background_images.map do |background_image|
      case background_image.type
      when 'fixed'
        "url(#{ asset_path(background_image.url) }) #{background_image_repeat_css(background_image)} fixed center top"
      when 'shift_up', 'scrolling'
        "url(#{ asset_path(background_image.url) }) #{background_image_repeat_css(background_image)} scroll center top"
      when 'shift_down'
        "url(#{ asset_path(background_image.url) }) #{background_image_repeat_css(background_image)} scroll center bottom"
      when 'shift_right'
        "url(#{ asset_path(background_image.url) }) #{background_image_repeat_css(background_image)} scroll right top"
      when 'shift_left'
        "url(#{ asset_path(background_image.url) }) #{background_image_repeat_css(background_image)} scroll left top"
      end
    end
  end
=end

  def background_image_repeat_css(background_image)
    background_image.tile ? "repeat" : "no-repeat"
  end
end
