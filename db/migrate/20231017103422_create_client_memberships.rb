class CreateClientMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :client_memberships do |t|

      t.timestamps
    end
  end
end
