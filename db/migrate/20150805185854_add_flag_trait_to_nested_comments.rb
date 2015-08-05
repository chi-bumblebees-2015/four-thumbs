class AddFlagTraitToNestedComments < ActiveRecord::Migration
  def change
    add_column :nested_comments, :flagged, :boolean, default: false
    add_column :nested_comments, :hidden, :boolean, default: false
  end
end
