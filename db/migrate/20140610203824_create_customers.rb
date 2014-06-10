class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email
      t.string :iugu_client_id
      t.string :iugu_payment_method_id
      t.string :card_display_number

      t.timestamps
    end
  end
end
