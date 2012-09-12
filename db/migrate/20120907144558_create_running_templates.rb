class CreateRunningTemplates < ActiveRecord::Migration
  def change
    create_table :running_templates do |t|
    	t.string	:name
    	t.integer	:distance
    	t.integer	:distance_per_week
    	t.integer   :distance_type
    	t.integer	:level
    	t.integer	:number_of_weeks
    	t.integer   :runs_per_week
      t.timestamps
    end
  end
end
