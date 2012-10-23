module PostsHelper
  def post_class(post)
    classes = []
    spaces = ['midground', 'foreground', 'background']

    classes << post.type

    if post.space == "auto"
      classes << cycle(*spaces, name: "space")
    else
      classes << post.space
      skip_to_cycle(post.space, spaces, "space")
    end

    classes << (post.has_shifting_background? ? 'bg-shifting' : 'bg-fixed')

    raw("class=\"#{classes.join(" ")}\"")
  end

  def post_quote_class(post)
    classes = []
    classes << post.style if post.type == "quote"

    raw("class=\"#{classes.join(" ")}\"")
  end

  def post_style(post)
    styles = []

    #layers go bg_img_fixed, :bg_img_shift_down_1, :bg_img_shift_down_2
    if post.has_background?
      bg_style = "background-image:"

      bg_urls = []
      bg_urls << "url(#{ asset_path(post.bg_img_fixed) })" if post.bg_img_fixed
      bg_urls << "url(#{ asset_path(post.bg_img_shift_down_1) })" if post.bg_img_shift_down_1
      bg_urls << "url(#{ asset_path(post.bg_img_shift_down_2) })" if post.bg_img_shift_down_2

      styles << bg_style + bg_urls.join(", ")
      #this needs to be made more specific to support different combos of fixed, shifting up to down, down to up, and side to side...
      styles << "background-position: 50% 0%" if post.has_shifting_background?
    end

    styles << "background-color: #{post.bg_color}" unless post.bg_color.blank?
    styles << "color: #{post.text_color}" unless post.text_color.blank?

    if styles.empty?
      ""
    else
      raw("style=\"#{styles.join(";")};\"")
    end
  end

  private

  def skip_to_cycle(set_to, cycle_values, cycle_name)
    until current_cycle(cycle_name) == set_to
      cycle(*cycle_values, :name => cycle_name)
    end
  end
end
