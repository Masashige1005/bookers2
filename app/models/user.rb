class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #bookと親子関係しとくよ！
  has_many :books, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  def email_required?
  	false
  end
  def email_changed?
  	false
  end
  #バリデーションチェックはここに入れとくよ！（空白、文字数制限を入れとくよ）
  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 20}
  validates :introduction, length: {maximum: 50}
end
