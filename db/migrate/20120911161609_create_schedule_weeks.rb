class CreateScheduleWeeks < ActiveRecord::Migration
  def change
    create_table :schedule_weeks do |t|
      t.date 		:start_date
      t.integer		:total_distance
      t.integer		:distance_type
      t.text		:description
      t.integer		:athlete_id
      t.timestamps
    end

    add_index :schedule_weeks, :athlete_id
  end
end
