json.array!(@customers) do |customer|
  json.extract! customer, :id, :email, :name, :city_id
  json.url customer_url(customer, format: :json)
end
