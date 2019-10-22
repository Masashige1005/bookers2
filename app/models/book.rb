class Book < ApplicationRecord
	belongs_to :user
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
	#投稿に紐づくユーザーの情報はよく使うのでインスタンスメソッドにしておく
	# def user
	# 	return User.find(self.user_id)
	# end
end

