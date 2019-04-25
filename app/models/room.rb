class Room < ApplicationRecord
  belongs_to :account

  has_many :computers, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
