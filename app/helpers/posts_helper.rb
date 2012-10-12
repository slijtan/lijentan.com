module PostsHelper
  def post_class(post)
    classes = []
    classes << post.type
    classes << (post.space == "auto" ? cycle('midground', 'foreground', 'background', name: "space") : post.space)
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

    styles << "background-color: #{post.bg_color}" if post.bg_color

    if styles.empty?
      ""
    else
      reset_cycle("space")
      raw("style=\"#{styles.join(";")};\"")
    end
  end
end
