module ApplicationHelper
  class CustomRenderer < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.highlight(code, language, line_numbers: :table, css: :class)
    end
  end

  def markdown(text)
    rndr = CustomRenderer.new(:filter_html => true, :hard_wrap => true)
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      strikethrough: true,
      superscript: true
    }
    markdown_to_html = Redcarpet::Markdown.new(rndr, options)
    markdown_to_html.render(text).html_safe
  end
end
