class CreateTrainers < ActiveRecord::Migration[7.0]
  def change
    create_table :trainers do |t|

      t.string :name
      t.string :username
      t.string :email
      t.string :phone_number
      t.string :role
      t.string :skill_area
      t.date :training_start_date
      t.date :training_end_date

      t.string :password_digest
      t.timestamps
    end
  end
end
