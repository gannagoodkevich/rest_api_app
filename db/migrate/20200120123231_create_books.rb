class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :genre
      t.integer :author_id
      t.integer :library_id
      t.integer :book_id

      t.timestamps
    end
  end
end
