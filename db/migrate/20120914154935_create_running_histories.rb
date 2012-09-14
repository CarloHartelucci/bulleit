class CreateRunningHistories < ActiveRecord::Migration
  def change
    create_table :running_histories do |t|
      t.integer :athlete_id
      t.integer :distance_per_week
      t.integer :distance_type
      t.integer :runs_per_week
      t.timestamps
    end
  end
end
