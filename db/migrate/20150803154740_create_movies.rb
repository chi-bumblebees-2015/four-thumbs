class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :aggregate_rating
      t.text :plot_summary

      t.timestamps null: false
    end
  end
end
