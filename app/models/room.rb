class Room < ApplicationRecord
  belongs_to :account

  has_many :computers, dependent: :destroy
  has_many :switches, through: :computers

  validates :name, presence: true, uniqueness: true

  def computer_owners
    computers.where(owner: true)
  end
end
