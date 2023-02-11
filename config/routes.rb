Rails.application.routes.draw do
  devise_for :users 
  #学習メモ：devise_forは、ユーザー機能に必要な複数のルーティングを一度に生成してくれるdeviseのメソッド
  root to: "items#index"
  resources :items, only: [:new, :create ,:show]
end
