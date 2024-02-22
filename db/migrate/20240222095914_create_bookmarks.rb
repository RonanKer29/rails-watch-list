class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.text :comment
      t.bigint :movie_id
      t.bigint :list_id

      t.timestamps
    end
    # add_index :bookmarks, :movie_id
    # add_foreign_key :bookmarks, :movies
    # add_index :bookmarks, :list_id
    # add_foreign_key :bookmarks, :lists
  end
end
