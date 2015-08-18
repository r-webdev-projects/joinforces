module ApplicationHelper

  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      no_styles:       true,
      safe_links_only: true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      highlight:          true,
      quote:              true,
      no_intra_emphasis:  true,
      lax_spacing:        true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

end
