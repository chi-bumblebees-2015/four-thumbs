class CreateNestedComments < ActiveRecord::Migration
  def change
    create_table :nested_comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :comment, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
