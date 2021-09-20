xml.instruct! :xml, :version => "1.0"
xml.rss version: "2.0", "xmlns:media" => 'http://search.yahoo.com/mrss/' do
  xml.channel do
    xml.title 'Neue Flohmi Artikel'
    xml.description 'Die neusten Flohmi Artikel'
    xml.link root_url

    @articles.each do |article|
      xml.item do
        xml.title article.title
        xml.description article.description

        image = article.images.first
        xml.media :content, url: polymorphic_url(image.representation(resize_to_fill: [350, 350])), type: image.content_type
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link article_url(article)
        xml.guid article_url(article)
      end
    end
  end
end
