class CreateClientTrainerRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :client_trainer_relationships do |t|

      t.timestamps
    end
  end
end
