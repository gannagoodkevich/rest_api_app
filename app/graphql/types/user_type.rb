module Types
  class UserType < Types::BaseObject
    field :id, String, null: false
    field :email, String, null: false
  end
end
