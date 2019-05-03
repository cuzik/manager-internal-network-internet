class Account < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :switches, dependent: :destroy
  has_many :ports, through: :switches
  has_many :computers, through: :rooms

  validates :name, presence: true, uniqueness: true
end
