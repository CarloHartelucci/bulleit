class CreateWorkoutLegs < ActiveRecord::Migration
  def change
    create_table :workout_legs do |t|
      t.integer :workout_id
      t.integer :distance
      t.integer :distance_type
      t.string  :min_pace
      t.string	:max_pace
      t.integer :repetitions
      t.integer :recovery
      t.timestamps
    end
    add_index :workout_legs, :workout_id
  end
end
