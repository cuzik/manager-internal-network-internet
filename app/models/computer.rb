class Computer < ApplicationRecord
  belongs_to :room
  belongs_to :account

  validates :name, presence: true, uniqueness: true
  validates :mac_address, presence: true, uniqueness: true
  validates :ip, presence: true, uniqueness: true
  validates :owner, presence: true
end
