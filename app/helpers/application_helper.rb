module ApplicationHelper

  class CustomRender < Redcarpet::Render::HTML
    def table(header, body)
      "<table class=\"table\">" \
        "#{header}#{body}" \
      "</table>"
    end

    def image(link, title, alt_text)
      "<img src=\"#{link}\" class=\"img-responsive\" alt=\"#{alt_text}\">"
    end
  end

  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(CustomRender, {
      autolink: true,
      space_after_headers: true,
      fenced_code_blocks: true,
      underline: true,
      highlight: true,
      footnotes: true,
      tables: true
    })
    @markdown.render(content)
  end


end
