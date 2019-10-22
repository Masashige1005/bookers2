Rails.application.routes.draw do
  resources :books, only: [:index, :edit, :update, :create, :show, :destroy, :top]
  resources :users, only: [:index, :edit, :update, :show, :destroy, :top]
  resources :profile_images, only: [:new, :create]
  root 'books#top'
  get 'home/about'
  # delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  devise_for :users

  # resources :books
  # devise_scope :user do
  # 	get '/users/sign_out' => 'devise/sessions#destroy'		#ログアウト出来なかった為追加しました。
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
