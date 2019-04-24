class Account < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :rooms, dependent: :destroy
end
