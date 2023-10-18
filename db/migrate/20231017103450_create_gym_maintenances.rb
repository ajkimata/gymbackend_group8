class CreateGymMaintenances < ActiveRecord::Migration[7.0]
  def change
    create_table :gym_maintenances do |t|
      
      t.string  :gym_equipment_id
      t.string  :maintenance_cost
      t.string  :gym_maintenance_description
      t.string  :maintenance_date

      t.timestamps
    end
  end
end
