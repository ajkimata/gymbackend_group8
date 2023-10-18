class CreateProgressTrackings < ActiveRecord::Migration[7.0]
  def change
    create_table :progress_trackings do |t|

      t.integer :client_id
      t.string  :progress_details

      t.timestamps
    end
  end
end
