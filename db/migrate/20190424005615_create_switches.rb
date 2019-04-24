class CreateSwitches < ActiveRecord::Migration[5.2]
  def change
    create_table :switches do |t|
      t.string :name, null: false, default: ""
      t.string :mac_address, null: false, default: ""

      t.timestamps
    end
  end
end
