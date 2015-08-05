class AddHiddenColumnToComments < ActiveRecord::Migration
  def change
    add_column :comments, :hidden, :boolean, default: false
  end
end
