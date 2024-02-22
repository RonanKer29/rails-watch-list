class AddBookmarksValidators < ActiveRecord::Migration[7.1]
  def change
    add_index :bookmarks, :movie_id
    add_foreign_key :bookmarks, :movies
    add_index :bookmarks, :list_id
    add_foreign_key :bookmarks, :lists
  end
end
