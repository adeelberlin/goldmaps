json.extract! node, :id, :room_name, :room_number, :room_capacity, :x, :y, :floor, :building, :created_at, :updated_at, :children
json.url node_url(node, format: :json)
