json.extract! product, :id, :name, :estimated_cost, :created_at, :updated_at
json.url product_url(product, format: :json)
