class CreateGymEquipments < ActiveRecord::Migration[7.0]
  def change
    create_table :gym_equipments do |t|

      t.timestamps
    end
  end
end
