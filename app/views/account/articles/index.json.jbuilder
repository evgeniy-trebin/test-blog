json.array!(@articles) do |article|
  json.extract! article, :id
  json.url account_article_url(article, format: :json)
end
