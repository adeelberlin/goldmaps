class NodeSerializer < ActiveModel::Serializer
  attributes :id, :room_name, :x, :y, :room_capacity, :room_number, :floor, :building, :children
end
