class CreateGymMaintenances < ActiveRecord::Migration[7.0]
  def change
    create_table :gym_maintenances do |t|

      t.timestamps
    end
  end
end
