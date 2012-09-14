class ChangeGoal < ActiveRecord::Migration
  def up
  	remove_column :goals, :distance
  	add_column :goals, :race_type, :integer
  end

  def down
  	  remove_column :goals, :race_type
  	  add_column :goals, :distance, :integer
  end
end
