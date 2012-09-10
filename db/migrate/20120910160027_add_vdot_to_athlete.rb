class AddVdotToAthlete < ActiveRecord::Migration
  def change
  	add_column :athletes, :vdot, :decimal
  end
end
