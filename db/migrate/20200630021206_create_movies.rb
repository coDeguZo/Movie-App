class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :backdrop_path
      t.string :adult
      t.string :overview
      t.string :poster_path
      t.string :release_date
      t.integer :revenue
      t.integer :runtime
      t.string :imdb_id
      t.string :tagline
      t.string :original_language
      t.string :genres
      t.string :tmdb_id
      t.timestamps
    end
  end
end