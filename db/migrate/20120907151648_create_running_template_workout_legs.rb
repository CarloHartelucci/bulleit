class CreateRunningTemplateWorkoutLegs < ActiveRecord::Migration
  def change
    create_table :running_template_workout_legs do |t|
      t.integer :running_template_workout_id
      t.decimal  :distance
      t.integer :distance_type
      t.integer :pace_type
      t.integer :repetitions
      t.integer :recovery
      t.timestamps
    end
    add_index :running_template_workout_legs, :running_template_workout_id, name:"running_template_workout_leg_index"
  end
end
