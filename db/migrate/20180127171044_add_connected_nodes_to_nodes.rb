class AddConnectedNodesToNodes < ActiveRecord::Migration[5.1]
  def change
    add_column :nodes, :connected_nodes, :json
  end
end
