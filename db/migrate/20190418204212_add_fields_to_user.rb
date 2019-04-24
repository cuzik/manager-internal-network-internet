class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :owner, :boolean, null: false, default: false
    add_reference :users, :account, foreign_key: true, null: false
  end
end
