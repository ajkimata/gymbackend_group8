class CreateClientReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :client_reviews do |t|

      t.string  :trainer_client_review
      t.integer :client_id

      t.integer :trainer_id

      t.timestamps
    end
  end
end
