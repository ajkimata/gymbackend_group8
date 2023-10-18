class CreateClientPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :client_payments do |t|

      t.integer :client_id
      t.string  :membership_type
      t.integer :payment_amount
      t.string  :payment_method
      t.date    :payment_date

      t.timestamps
    end
  end
end
