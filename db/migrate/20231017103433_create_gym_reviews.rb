class CreateGymReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :gym_reviews do |t|

      t.timestamps
    end
  end
end
