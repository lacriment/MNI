class CreateWatchLists < ActiveRecord::Migration
  def change
    create_table :watch_lists do |t|
      t.integer :movie_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
