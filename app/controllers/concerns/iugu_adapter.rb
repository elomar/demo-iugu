class IuguAdapter
  def self.create_customer_from_token(email, token)
    customer = Iugu::Customer.create(
      email: email,
      name: email)

    payment_method = customer.payment_methods.create(
      description: "Cartão de Crédito",
      token: token,
      set_as_default: true)

    {
      iugu_client_id: customer.id,
      iugu_payment_method_id: payment_method.id,
      card_display_number: payment_method.data["display_number"]
    }
  end

  def self.create_charge(email, payment_method_id, price)
    charge = Iugu::Charge.create(
      email: email,
      customer_payment_method_id: payment_method_id,
      items: [{
        description: "Item Um",
        quantity: "1",
        price_cents: (price * 100).to_i}])

    charge.invoice_id
  end
end
