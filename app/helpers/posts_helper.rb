module PostsHelper

  def render_post_element(post_element)
    render partial: post_element.element_type.underscore, locals: {post_element: post_element}
  end

  def render_album_element(album_element)
    render partial: album_element.element_type.underscore, locals: {element: album_element.element}
  end

  #TODO refactor the attribute functions a bit
  def video_attributes(post_element)
    video = post_element.element
    position_classes, position_css, position_data = post_element.position_classes_and_css_and_data

    classes = []
    classes << "video"
    classes << video.style
    classes << video.host
    classes << post_element.animation_type if post_element.animation_type
    classes.concat(position_classes)

    styles = []
    styles << "z-index: #{post_element.sequence}" if post_element.sequence
    styles.concat(position_css)

    data = {}
    data["animation-direction"] = post_element.animation_direction if post_element.animation_direction
    data.merge!(position_data)

    html_id = "id=\"#{post_element.id}\""
    html_classes = "class=\"#{classes.join(" ")}\""
    html_styles = "style=\"#{styles.join(";")}\""
    html_data = data.to_a.inject("") {|res, hash_key_val| res += "data-#{hash_key_val[0]}=\"#{hash_key_val[1]}\""}

    raw("#{html_id} #{html_classes} #{html_styles} #{html_data}")
  end

  def sprite_attributes(post_element)
    sprite = post_element.element
    position_classes, position_css, position_data = post_element.position_classes_and_css_and_data

    classes = []
    classes << "sprite"
    classes << sprite.style
    classes << post_element.animation_type if post_element.animation_type
    classes.concat(position_classes)

    styles = []
    styles << "background: url(#{ asset_path(sprite.url) })"
    styles << "z-index: #{post_element.sequence}" if post_element.sequence
    styles.concat(position_css)

    data = {}
    data["animation-direction"] = post_element.animation_direction if post_element.animation_direction
    data["width"] = sprite.width if sprite.width
    data["height"] = sprite.height if sprite.height
    data.merge!(position_data)

    html_id = "id=\"#{post_element.id}\""
    html_classes = "class=\"#{classes.join(" ")}\""
    html_styles = "style=\"#{styles.join(";")}\""
    html_data = data.to_a.inject("") {|res, hash_key_val| res += "data-#{hash_key_val[0]}=\"#{hash_key_val[1]}\""}

    raw("#{html_id} #{html_classes} #{html_styles} #{html_data}")
  end

  def photo_attributes(photo)
    styles = []

    if photo.album_element &&
        photo.album.style == "comic" &&
        post_data = Album.album_comic_data_for_index(photo.album_element.sequence - 1)

      styles << "top: #{post_data[:top]}px"
      styles << "left: #{post_data[:left]}px"
      styles << "width: #{post_data[:width]}px"
      styles << "height: #{post_data[:height]}px"
      styles << "z-index: #{post_data[:z_index]}"
    end

    data = {}
    data["full-size-url"] = photo.url

    html_styles = "style=\"#{styles.join(";")}\""
    html_data = data.to_a.inject("") {|res, hash_key_val| res += "data-#{hash_key_val[0]}=\"#{hash_key_val[1]}\""}

    raw("#{html_styles} #{html_data}")
  end

  def album_attributes(post_element)
    album = post_element.element
    position_classes, position_css, position_data = post_element.position_classes_and_css_and_data

    classes = []
    classes << "album"
    classes << album.style
    classes.concat(position_classes)

    styles = []
    styles << "z-index: #{post_element.sequence}" if post_element.sequence
    styles.concat(position_css)

    html_id = "id=\"#{post_element.id}\""
    html_classes = "class=\"#{classes.join(" ")}\""
    html_styles = "style=\"#{styles.join(";")}\""

    raw("#{html_id} #{html_classes} #{html_styles}")
  end

  def text_box_attributes(post_element)
    text_box = post_element.element

    position_classes, position_css, position_data = post_element.position_classes_and_css_and_data

    classes = []
    classes << "text-box"
    classes << text_box.style
    classes << post_element.animation_type if post_element.animation_type
    classes << post_element.three_phase_initial if post_element.animation_type == "three-phase"
    classes.concat(position_classes)

    styles = []
    styles << "font-size:#{text_box.text_size}px" if text_box.text_size
    styles << "color:#{text_box.text_color}" if text_box.text_color
    styles << "text-align:#{text_box.text_align}" if text_box.text_align
    styles << "z-index: #{post_element.sequence}" if post_element.sequence
    styles << "background: url(#{text_box.background_image_url}) repeat" if text_box.background_image_url
    styles << "background-color: #{text_box.bg_color}" unless text_box.bg_color.blank?
    styles.concat(position_css)

    data = {}
    data["animation-direction"] = post_element.animation_direction if post_element.animation_direction
    data.merge!(position_data)

    html_id = "id=\"#{post_element.id}\""
    html_classes = "class=\"#{classes.join(" ")}\""
    html_styles = "style=\"#{styles.join(";")}\""
    html_data = data.to_a.inject("") {|res, hash_key_val| res += "data-#{hash_key_val[0]}=\"#{hash_key_val[1]}\""}

    raw("#{html_id} #{html_classes} #{html_styles} #{html_data}")
  end

  def post_attributes(post)
    classes = %w[post]

    if post.space == "auto"
      space = cycle(*spaces, name: "space")
      logger.debug("space is auto #{space}")
    elsif spaces.include?(post.space)
      space = post.space
      logger.debug("space is set #{space}")
      skip_to_cycle(post.space, spaces, "space")
    elsif post.space == 'mid-to-foreground'
      space = post.space
      skip_to_cycle('foreground', spaces, "space")
    elsif post.space == 'back-to-midground'
      space = post.space
      skip_to_cycle('midground', spaces, "space")
    end

    classes << space if space
    classes << post.effect if post.effect
    classes << "padding-#{post.padding}" if post.padding
    classes << 'full-screen' if post.height == 'full-screen'
    classes << 'title' if post.is_header_post?

    html_classes = "class=\"#{classes.join(" ")}\""

    styles = []
    styles << "background-color: #{post.bg_color}" unless post.bg_color.blank?
    styles << "min-height: #{post.height}" unless post.height.blank? || post.height == 'full-screen'
    styles << "z-index: #{post.depth}" if post.depth

    html_styles = "style=\"#{styles.join(";")}\"" unless styles.empty?

    raw("#{html_classes} #{html_styles}")
  end

  def render_shadows(post)
    if post.space == 'mid-to-foreground'
      content_tag(:div, nil, class: "shadow-midground-top") + content_tag(:div, nil, class: "shadow-foreground-bottom")
    elsif post.space == 'back-to-midground'
      content_tag(:div, nil, class: "shadow-background-top") + content_tag(:div, nil, class: "shadow-midground-bottom")
    elsif post.space
      content_tag(:div, nil, class: "shadow-#{current_cycle('space')}-top") + content_tag(:div, nil, class: "shadow-#{current_cycle('space')}-bottom")
    end
  end

  def spaces
    ['midground', 'foreground', 'background']
  end

  def skip_to_cycle(set_to, cycle_values, cycle_name)
    until current_cycle(cycle_name) == set_to
      logger.debug("cycling to #{current_cycle(cycle_name)}")
      cycle(*cycle_values, :name => cycle_name)
    end

    logger.debug("cycle at #{current_cycle(cycle_name)}")
  end

end
