Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pictures#new"                                 #トップページ兼画像送信ページ
  get "/:id", to: "pictures#show"                   #生成後画像表示ページ
  get "/:id", to: "pictures#new", as:"create"
  get "/", to: "pictures#new", as:"pictures"                      
  post "/", to: "pictures#create"                  #画像生成POST
end
