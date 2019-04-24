class Room < ApplicationRecord
  belongs_to :account

  has_many :computers, dependent: :destroy
end
