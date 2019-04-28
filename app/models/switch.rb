class Switch < ApplicationRecord
  belongs_to :account

  has_many :ports, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :mac_address, presence: true, uniqueness: true
  validates_format_of :mac_address,
                      with: /\A^([0-9a-fA-F]{2}[:-]){5}[0-9a-fA-F]{2}$\Z/i,
                      message: "Não irmãozinho"
end
