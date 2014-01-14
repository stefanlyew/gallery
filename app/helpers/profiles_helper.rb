module ProfilesHelper
  def markdown text
    @markdown.render(text.to_s).html_safe
  end
end
