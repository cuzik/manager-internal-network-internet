class Computer < ApplicationRecord
  belongs_to :room
  has_one :port
end
