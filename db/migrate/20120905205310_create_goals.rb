class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
    	t.integer :athlete_id
    	t.string  :race
    	t.decimal :distance
    	t.date	  :date
    	t.string  :goal_time
    	t.string  :name
      t.timestamps
    end

    add_index :goals, :athlete_id
  end
end
