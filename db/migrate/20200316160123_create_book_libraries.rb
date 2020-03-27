class CreateBookLibraries < ActiveRecord::Migration[6.0]
  def change
    create_table :book_libraries do |t|
      t.integer :book_id
      t.integer :library_id

      t.timestamps
    end
  end
end
