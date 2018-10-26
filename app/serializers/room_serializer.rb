class RoomSerializer < ActiveModel::Serializer
  attributes :id, :publisher_id, :subscriber_id
end
