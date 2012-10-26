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
    classes << (post.has_shifting_background? ? 'bg-shifting' : 'bg-fixed')

    html_classes = "class=\"#{classes.join(" ")}\""

    #AND NOW STYLES
    styles = []

    #layers go bg_img_fixed, :bg_img_shift_down_1, :bg_img_shift_down_2
    if post.has_background?
      bg_urls = []
      bg_urls << bg_urls_for_space(space)
      bg_urls << "url(#{ asset_path(post.bg_img_fixed) }) no-repeat top left" if post.bg_img_fixed
      bg_urls << "url(#{ asset_path(post.bg_img_shift_down_1) }) no-repeat top left" if post.bg_img_shift_down_1
      bg_urls << "url(#{ asset_path(post.bg_img_shift_down_2) }) no-repeat top left" if post.bg_img_shift_down_2

      #styles << "background-image: #{bg_urls.join(', ')}"
      styles << "background: #{bg_urls.join(', ')}"

      #this needs to be made more specific to support different combos of fixed, shifting up to down, down to up, and side to side...
      bg_position = ["center top", "center bottom"]
      bg_position << "50% 0%" if post.has_shifting_background?
      #styles << "background-position: #{bg_position.join(', ')}"

      #styles << "background-repeat: repeat-x, repeat-x"
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

end
