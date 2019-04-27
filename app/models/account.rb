class Account < ApplicationRecord
  has_many :computers, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :switches, dependent: :destroy
  has_many :ports, through: :switches
end
