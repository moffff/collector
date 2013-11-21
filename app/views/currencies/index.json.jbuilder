json.array!(@currencies) do |currency|
  json.extract! currency, :code, :name
  json.url currency_url(currency, format: :json)
end
