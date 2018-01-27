class RemoveConnectedNodesFromNode < ActiveRecord::Migration[5.1]
  def change
    remove_column :nodes, :connected_nodes
  end
end
