class Port < ApplicationRecord
  belongs_to :switch
  belongs_to :computer

  validates :number, presence: true, uniqueness: {
    scope: :switch_id,
    message: 'Não parça.'
  }
end
