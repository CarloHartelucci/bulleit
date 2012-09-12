class AddSequenceToRunningTemplateWorkouts < ActiveRecord::Migration
  def change
  	add_column :running_template_workouts, :sequence, :integer
  end
end
