class CreateRaceHistories < ActiveRecord::Migration
  def change
    create_table :race_histories do |t|
   	  t.integer		:athlete_id
   	  t.integer		:race_type
   	  t.date		:race_date
   	  t.string		:results
   	  t.string		:name
      t.timestamps
    end
  end
end
