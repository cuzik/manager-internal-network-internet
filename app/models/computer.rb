class Computer < ApplicationRecord
  belongs_to :room
  belongs_to :account
  belongs_to :port, optional: true

  has_one :switch, through: :port

  validates :name, presence: true, uniqueness: true
  validates :mac_address, presence: true, uniqueness: true
  validates :ip, presence: true, uniqueness: true
  validates :port_id, uniqueness: true, allow_blank: true, allow_nil: true
end
