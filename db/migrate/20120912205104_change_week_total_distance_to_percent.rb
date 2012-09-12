class ChangeWeekTotalDistanceToPercent < ActiveRecord::Migration
  def up
  	remove_column :running_template_weeks, :total_distance
  	remove_column :running_template_weeks, :distance_type
  	add_column :running_template_weeks, :distance_percent, :integer
  end

  def down
  	add_column :running_template_weeks, :total_distance, :decimal
  	add_column :running_template_weeks, :distance_type, :integer
  	remove_column :running_template_weeks, :distance_percent
  end
end
