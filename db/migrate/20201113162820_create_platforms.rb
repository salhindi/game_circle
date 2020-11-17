class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.string :name
      t.string :image
      t.string :games
      t.integer :user_id
    end
  end
end
