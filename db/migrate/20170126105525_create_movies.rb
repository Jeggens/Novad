class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.references :actor, index: true, foreign_key: true
      t.integer :year
      t.string :cover
      t.text :plot

      t.timestamps null: false
    end
  end
end
