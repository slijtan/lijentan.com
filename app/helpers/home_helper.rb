module HomeHelper
  def post_class(post)
    classes = []
    classes << post.type
    classes << post.space == "auto" ? cycle('midground', 'foreground', 'background', name: "space") : post.space
    classes << (post.shifting_background ? 'bg-shifting' : 'bg-fixed')

    "class='" + classes.join(" ") + "'"
  end

  def post_style(post)
    styles = []

    unless post.background_url.blank?
      bg_style = "background-image:"
      bg_style += "url(#{ asset_path(post.foreground_url) })," unless post.foreground_url.blank?
      bg_style += "url(#{ asset_path(post.background_url) })"

      styles << bg_style
      styles << "background-position: 50% 0%"
    end

    if styles.empty?
      ""
    else
      reset_cycle("space")
      "style='" + styles.join(";") + "'"
    end
  end
end
