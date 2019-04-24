class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :name, null: false, default: ""
      t.string :cpf, null: false, default: ""
      t.boolean :owner, null: false, default: false

      t.belongs_to :account, index: true, null: false
    end
  end
end
