module ApplicationHelper

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :no_intra_emphasis => true, :fenced_code_blocks => true, :strikethrough => true, :superscript => true)
    markdown.render(text).html_safe
  end

end
