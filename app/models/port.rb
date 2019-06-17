class Port < ApplicationRecord
  belongs_to :switch

  has_one :account, through: :switch
  has_one :computer

  validates :number, presence: true, uniqueness: {
    scope: :switch_id,
    message: 'Não parça.'
  }

  def change_status!
    update(enabled: !enabled?)
  end
end
