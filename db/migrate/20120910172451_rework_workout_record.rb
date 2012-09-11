class ReworkWorkoutRecord < ActiveRecord::Migration
  def up
  	drop_table :workouts
  	create_table :workouts do |t|
      t.integer :workout_type
      t.string :description
      t.decimal :total_distance
      t.integer :distance_type
      t.date  :date
      t.integer :athlete_id

      t.timestamps
    end

    add_index :workouts, :athlete_id
  end

  def down
  	drop_table :workouts
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
