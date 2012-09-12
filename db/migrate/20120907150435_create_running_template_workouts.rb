class CreateRunningTemplateWorkouts < ActiveRecord::Migration
  def change
    create_table :running_template_workouts do |t|
      t.integer :running_template_week_id
      t.integer :total_distance
      t.integer :distance_type
      t.text    :description
      t.timestamps
    end

    add_index :running_template_workouts, :running_template_week_id, name: "running_template_workout_week_index"
  end
end
