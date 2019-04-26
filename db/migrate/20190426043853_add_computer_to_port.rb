class AddComputerToPort < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.belongs_to :computer, index: true
    end
  end
end
