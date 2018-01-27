class Node < ApplicationRecord
  has_and_belongs_to_many :parents, class_name: 'Node', join_table: :node_associations, foreign_key: :child_id, association_foreign_key: :parent_id
  has_and_belongs_to_many :children, class_name: 'Node', join_table: :node_associations, foreign_key: :parent_id, association_foreign_key: :child_id
end
