class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.string :actor_image
      t.string :imdb_link

      t.timestamps
    end
  end
end
