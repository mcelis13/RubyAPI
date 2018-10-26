class UserSerializer < ActiveModel::Serializer
  attributes :user_name, :bio, :avatar
end
