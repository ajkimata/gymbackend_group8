class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|

      t.string :name
      t.string :username
      t.string :email
      t.string :phone_number
      t.string :role
      t.string :membership_type
      t.date :membership_start_date
      t.date :membership_end_date
      t.integer :trainer_id
      t.text :fitness_goals
      t.text :reviews
      
      t.timestamps
    end
  end
end
