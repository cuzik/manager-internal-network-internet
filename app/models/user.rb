class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  belongs_to :account

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: { case_sensitive: false }

  def get_mac_by_ip
    system("ping -c 1 #{current_sign_in_ip}")
    x = `arp -an | grep #{current_sign_in_ip}`

    return "AA:AA:BB:BB:CC:CC" if x.blank?

    x.split(" at ")[1].split(" ")[0]
  end
end
