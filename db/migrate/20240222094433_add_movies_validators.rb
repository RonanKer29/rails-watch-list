class AddMoviesValidators < ActiveRecord::Migration[7.1]
  def change
    change_column_null :movies, :title, false
    add_index :movies, :title, unique: true
    change_column_null :movies, :overview, false
  end
end
