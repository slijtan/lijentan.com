module PostsHelper
  def spaces
    ['midground', 'foreground', 'background']
  end

  def post_class_and_style(post)
    #CLASSES FIRST
    classes = []

    classes << post.type

    if post.space == "auto"
      space = cycle(*spaces, name: "space")
      logger.debug("space is auto #{space}")
    else
      space = post.space
      logger.debug("space is set #{space}")
      skip_to_cycle(post.space, spaces, "space")
    end

    classes << space
    classes << background_class(post)
    classes << post.style unless post.style.blank?
    classes << post.effect unless post.effect.blank?

    html_classes = "class=\"#{classes.join(" ")}\""

    #AND NOW STYLES
    styles = []

    if post.has_background?
      bg_urls = []
      bg_urls << bg_urls_for_space(space)
      bg_urls << background_css(post)
      styles << "background: #{bg_urls.join(', ')}"
    end

    styles << "background-color: #{post.bg_color}" unless post.bg_color.blank?
    styles << "min-height: #{post.min_height}px" unless post.min_height.blank?

    unless styles.empty?
      html_styles = "style=\"#{styles.join(";")}\""
    end

    raw("#{html_classes} #{html_styles}")
  end

  def quote_class_and_style(quote)
    html_classes = "class=\"#{quote.type}\""

    styles = []
    styles << "font-size: #{quote.text_size}px" unless quote.text_size.blank?
    styles << "color: #{quote.text_color}" unless quote.text_color.blank?

    unless styles.empty?
      html_styles = "style=\"#{styles.join(";")}\""
    end

    raw("#{html_classes} #{html_styles}")
  end

  def image_class_and_style(image)
    @image_index ||= {}
    index = (@image_index[image.post_id] ||= 0)

    styles = []

    if post_data = Post.album_comic_data_for_index(index)
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

  def background_class(post)
    post.background_images.empty? ? "bg-none" : (["bg"] << post.background_images.map {|image| image.type }).join("-")
  end

  def background_css(post)
    post.background_images.map do |background_image|
      case background_image.type
      when 'fixed'
        "url(#{ asset_path(background_image.url) }) #{background_image_repeat_css(background_image)} fixed center top"
      when 'shift_up', 'scrolling'
        "url(#{ asset_path(background_image.url) }) #{background_image_repeat_css(background_image)} center top"
      when 'shift_down'
        "url(#{ asset_path(background_image.url) }) #{background_image_repeat_css(background_image)} center bottom"
      when 'shift_right'
        "url(#{ asset_path(background_image.url) }) #{background_image_repeat_css(background_image)} right top"
      when 'shift_left'
        "url(#{ asset_path(background_image.url) }) #{background_image_repeat_css(background_image)} left top"
      end
    end
  end

  def background_image_repeat_css(background_image)
    background_image.tile ? "repeat" : "no-repeat"
  end
end
