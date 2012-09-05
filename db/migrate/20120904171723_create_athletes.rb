class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :email
      t.string :user_name
      t.string :fb_user_id
      t.string :access_token
      t.string :remember_token	
      t.timestamps
    end

    add_index :athletes, :fb_user_id
    add_index :athletes, :remember_token
  end
end
