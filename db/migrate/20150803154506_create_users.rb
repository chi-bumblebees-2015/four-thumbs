class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :name, null: false
      t.string :password_digest, null: false
      t.string :email, null: false
      t.boolean :trusted, default: false
      t.boolean :admin


      t.timestamps null: false
    end
  end
end
