class PaymentsController < ApplicationController
  def create
    customer = Customer.find(params[:customer_id])
    iugu_invoice_id = IuguAdapter.create_charge(
      customer.email, 
      customer.iugu_payment_method_id,
      10.50)
    customer.payments.create(value: 10.50, iugu_invoice_id: iugu_invoice_id)

    redirect_to customers_path, notice: 'Customer was charged.'
  end
end
