class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :customer, index: true
      t.string :iugu_invoice_id
      t.decimal :value, precision: 8, scale: 2

      t.timestamps
    end
  end
end
