class CreateClientReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :client_reviews do |t|

      t.timestamps
    end
  end
end
