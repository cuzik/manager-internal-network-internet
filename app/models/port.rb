class Port < ApplicationRecord
  belongs_to :switch

  validates :number, presence: true, uniqueness: {
    scope: :switch_id,
    message: 'Não parça.'
  }
end
