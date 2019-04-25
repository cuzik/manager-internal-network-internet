class Port < ApplicationRecord
  belongs_to :switch

  validates :number, presence: true, uniqueness: {
    scope: :switch_id,
    message: 'Não parça.'
  }
  validates :enabled, presence: true
  validates :editabled, presence: true
end
