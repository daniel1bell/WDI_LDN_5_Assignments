class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :name
      t.string :type
      t.references :genre
      t.string :movie_image
      t.string :imdb_link

      t.timestamps
    end
    add_index :media, :genre_id
  end
end
