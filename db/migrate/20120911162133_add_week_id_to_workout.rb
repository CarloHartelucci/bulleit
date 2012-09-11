class AddWeekIdToWorkout < ActiveRecord::Migration
  def change
  	add_column :workouts, :schedule_week_id, :integer
  	add_index  :workouts, :schedule_week_id
  end
end
