class CreateRunningTemplateWeeks < ActiveRecord::Migration
  def change
    create_table :running_template_weeks do |t|
    	t.integer :running_template_id
    	t.integer :total_distance
    	t.integer :distance_type
    	t.integer :sequence
    	t.text    :description
      t.timestamps
    end

    add_index :running_template_weeks, :running_template_id
  end
end
