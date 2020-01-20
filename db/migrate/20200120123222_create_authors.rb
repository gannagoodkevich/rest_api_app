class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :book_id

      t.timestamps
    end
  end
end
