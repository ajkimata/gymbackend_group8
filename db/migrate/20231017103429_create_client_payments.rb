class CreateClientPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :client_payments do |t|

      t.timestamps
    end
  end
end
