class CreateGymReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :gym_reviews do |t|

      t.string  :gym_review
      t.integer :client_id
      t.date    :gym_review_date
      
      t.timestamps
    end
  end
end
