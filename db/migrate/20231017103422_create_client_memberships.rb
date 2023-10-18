class CreateClientMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :client_memberships do |t|

      t.string  :membership_type
      t.string  :membership_description
      t.integer :client_id

      t.timestamps
    end
  end
end
