class CreateComputers < ActiveRecord::Migration[5.2]
  def change
    create_table :computers do |t|
      t.string :name, null: false, default: ""
      t.string :mac_address, null: false, default: ""
      t.string :ip, null: false, default: ""
      t.boolean :owner, null: false, default: false

      t.belongs_to :room, index: true
      t.belongs_to :port, index: true

      t.timestamps
    end

    add_index :computers, :name, unique: true
    add_index :computers, :mac_address, unique: true
    add_index :computers, :ip, unique: true
  end
end
