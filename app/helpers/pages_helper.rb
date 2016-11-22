module PagesHelper
  
  def google_url(lang)
    link_to lang, "https://www.google.com/search?q=#{lang}", :target => "_blank"
  end
  
  def link_sentence(langs)
    urls = []
    langs.each do |lang|
      urls << google_url(lang)
    end
    urls.to_sentence
  end
  
end
