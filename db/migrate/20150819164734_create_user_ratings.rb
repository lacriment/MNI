class CreateUserRatings < ActiveRecord::Migration
  def change
    create_table :user_ratings do |t|
    	t.integer :user_id
    	t.integer :movie_id
    	t.integer :rating

    	t.timestamps null: false
    end
  end
end
