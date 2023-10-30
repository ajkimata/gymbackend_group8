class AddUsernameToTrainers < ActiveRecord::Migration[7.0]
  def change
    add_column :trainers, :username, :string
    add_index :trainers, :username, unique: true
  end
end
