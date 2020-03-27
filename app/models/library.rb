class Library < ApplicationRecord
  has_many :book_libraries
  has_many :books, through: :book_libraries
end
