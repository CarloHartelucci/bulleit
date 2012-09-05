class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :summary
      t.string :details
      t.integer :miles
      t.date  :date
      t.integer :athlete_id

      t.timestamps
    end

    add_index :workouts, :athlete_id
  end
end
