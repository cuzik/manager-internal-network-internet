class Switch < ApplicationRecord
  has_many :ports, dependent: :destroy

end
