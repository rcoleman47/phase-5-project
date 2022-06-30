class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :cell_number, :admin, :roll

  belongs_to :company
end
