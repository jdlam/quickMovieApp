class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :type
      t.integer :year
      t.integer :rating
      t.string :comment
    end
  end
end
