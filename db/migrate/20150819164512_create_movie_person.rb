class CreateMoviePerson < ActiveRecord::Migration
  def change
    create_table :movie_people do |t|
    	t.integer :movie_id
      t.integer :person_id
      t.string :role

      t.timestamps null: false
    end
  end
end
