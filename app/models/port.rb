class Port < ApplicationRecord
  belongs_to :switch
  has_one :account, through: :switch

  has_one :computer

  validates :number, presence: true, uniqueness: {
    scope: :switch_id,
    message: 'Não parça.'
  }
  # validates :computer, uniqueness: true, allow_blank: true, allow_nil: true
end
