class CreateMovieGenre < ActiveRecord::Migration
  def change
    create_table :movie_genres do |t|
    	t.integer :movie_id
      t.integer :genre_id

      t.timestamps null: false
    end
  end
end
