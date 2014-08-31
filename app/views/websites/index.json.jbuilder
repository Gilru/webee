json.array!(@websites) do |website|
  json.extract! website, :id, :name, :url, :description, :price
  json.url website_url(website, format: :json)
end
