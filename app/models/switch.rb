class Switch < ApplicationRecord
  belongs_to :account

  has_many :ports, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :mac_address, presence: true, uniqueness: true
end
