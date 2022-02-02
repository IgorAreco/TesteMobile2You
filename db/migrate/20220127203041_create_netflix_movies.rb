class CreateNetflixMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :netflix_movies do |t|
      t.string :show_id
      t.string :title
      t.string :genre
      t.integer :year
      t.string :country
      t.string :published_at
      t.text :description

      t.timestamps
    end
  end
end
