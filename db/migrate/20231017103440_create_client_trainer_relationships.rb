class CreateClientTrainerRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :client_trainer_relationships do |t|

      t.integer :client_id
      t.integer :trainer_id

      t.timestamps
    end
  end
end
