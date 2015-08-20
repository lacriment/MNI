class AddAverageFieldToMovie < ActiveRecord::Migration
  def change
  	add_column :movies, :average, :float, default: 0
  end
end
