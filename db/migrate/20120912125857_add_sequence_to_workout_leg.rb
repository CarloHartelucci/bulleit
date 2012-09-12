class AddSequenceToWorkoutLeg < ActiveRecord::Migration
  def change
  	add_column :running_template_workout_legs, :sequence, :integer
  end
end
