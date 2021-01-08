class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,          presence: true, length: { maximum: 50 },
                            uniqueness: { case_sensitive: true }
  validates :description,   presence: true, length: { maximum: 1000 }
  has_many  :rooms,          dependent: :destroy
  has_many  :reservations,   dependent: :destroy
  has_many  :reserved_rooms, through:   :reservations, source: :room
  has_one_attached :icon_img
  attribute        :new_icon_img

  before_save do
    if new_icon_img
      self.icon_img = new_icon_img
    end
  end
end
