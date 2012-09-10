class CreateTrainingPaces < ActiveRecord::Migration
  def change
    create_table :training_paces do |t|
      t.integer :pace_type
      t.string :min_pace
      t.string :max_pace
      t.integer :athlete_id
      t.timestamps
    end
    add_index :training_paces, :athlete_id
  end
end
