class CreateTrainerPerformances < ActiveRecord::Migration[7.0]
  def change
    create_table :trainer_performances do |t|

      t.timestamps
    end
  end
end
