module ApplicationHelper
  def auth_token
    <<-HTML.html_safe
    <input 
      type="hidden"
      name="authenticity_token"
      value="#{form_authenticity_token}"/>
    HTML
  end

  def ugly_lyrics(lyrics)
    formatted = ""
    lyrics.lines.each do |line|
      formatted << "&#9835; #{h(line)}"
    end

    "<pre class='lyrics'>#{formatted}</pre>".html_safe
  end
end
