module PostsHelper
  def post_class_and_style(post)
    #CLASSES FIRST
    classes = []
    spaces = ['midground', 'foreground', 'background']

    classes << post.type

    if post.space == "auto"
      space = cycle(*spaces, name: "space")
    else
      space = post.space
      skip_to_cycle(post.space, spaces, "space")
    end

    classes << space
    classes << background_class(post)

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
    styles << "color: #{post.text_color}" unless post.text_color.blank?

    if styles.empty?
      ""
    else
      html_styles = "style=\"#{styles.join(";")}\""
    end

    raw("#{html_classes} #{html_styles}")
  end

  def post_quote_class(post)
    classes = []
    classes << post.style if post.type == "quote"

    raw("class=\"#{classes.join(" ")}\"")
  end

  def post_style(post)

  end

  private

  def skip_to_cycle(set_to, cycle_values, cycle_name)
    until current_cycle(cycle_name) == set_to
      cycle(*cycle_values, :name => cycle_name)
    end
  end

  def bg_urls_for_space(space)
    case space
    when 'foreground'
      return "url(/assets/layout/divider-foreground-top.png) repeat-x center top", "url(/assets/layout/divider-foreground-bottom.png) repeat-x center bottom"

    when 'midground'
      return "url(/assets/layout/divider-midground-top.png) repeat-x center top", "url(/assets/layout/divider-midground-bottom.png) repeat-x center bottom"

    when 'background'
      return "url(/assets/layout/divider-background-top.png) repeat-x center top", "url(/assets/layout/divider-background-bottom.png) repeat-x center bottom"
    end

  end

  def background_class(post)
    post.background_images.empty? ? "bg-none" : (["bg"] << post.background_images.map {|image| image.type }).join("-")
  end

  def background_css(post)
    post.background_images.map do |background_image|
      case background_image.type
      when 'fixed', 'shift_up'
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
