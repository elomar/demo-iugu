json.array!(@customers) do |customer|
  json.extract! customer, :id, :email, :iugu_client_id, :iugu_payment_method_id, :card_display_number
  json.url customer_url(customer, format: :json)
end
