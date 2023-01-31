Rails.application.routes.draw do
  devise_for :users #devise_forは、ユーザー機能に必要な複数のルーティングを一度に生成してくれるdeviseのメソッド
  root to: "items#index"
end
