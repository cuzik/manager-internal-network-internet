class CreateSwitches < ActiveRecord::Migration[5.2]
  def change
    create_table :switches do |t|
      t.string :name, null: false, default: ""
      t.string :mac_address, null: false, default: ""

      t.belongs_to :account, index: true, null: false

      t.timestamps
    end

    add_index :switches, :name,        unique: true
    add_index :switches, :mac_address, unique: true
  end
end
