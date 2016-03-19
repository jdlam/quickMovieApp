class AddColumnPosterurl < ActiveRecord::Migration
  def change
    add_column :movies, :posterURL, :string
  end
end
