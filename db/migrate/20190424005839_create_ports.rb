class CreatePorts < ActiveRecord::Migration[5.2]
  def change
    create_table :ports do |t|
      t.integer :number, null: false, default: 0
      t.boolean :enabled, null: false, default: true
      t.boolean :editabled, null: false, default: true
      t.belongs_to :switch, index: true, null: false

      t.timestamps
    end
  end
end
