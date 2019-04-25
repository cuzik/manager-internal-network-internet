class Computer < ApplicationRecord
  belongs_to :room
  belongs_to :account

  has_one :port
end
