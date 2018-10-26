class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :bio, :avatar
end
