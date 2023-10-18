class CreateTrainerPerformances < ActiveRecord::Migration[7.0]
  def change
    create_table :trainer_performances do |t|

      t.integer :trainer_id
      t.string  :trainer_remarks

      t.timestamps
    end
  end
end
