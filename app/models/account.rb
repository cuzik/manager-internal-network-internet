class Account < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :switches, dependent: :destroy
  has_many :computers, dependent: :destroy
end
