class Book < ApplicationRecord
	#ユーザーと紐付けするよ！
	belongs_to :user
	#バリデーションチェックはここ記載するよ！
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end

