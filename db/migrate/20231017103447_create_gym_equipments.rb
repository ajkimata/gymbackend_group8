class CreateGymEquipments < ActiveRecord::Migration[7.0]
  def change
    create_table :gym_equipments do |t|

      t.string  :gym_equipment_type
      t.string  :gym_equipment_dexcription
      t.string  :model_number
      t.string  :serial_number
      t.string  :gym_maintenance_schedule
      t.string  :purchase_date

      t.timestamps
    end
  end
end
