json.array!(@prices) do |price|
  json.extract! price, :id, :ticker, :when, :high, :low, :open, :close, :other
  json.url price_url(price, format: :json)
end
