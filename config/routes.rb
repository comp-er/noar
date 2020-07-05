Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
	#상세보기에 해당하는 show함수 빼고 다 라우트 규칙 생성
  resources :posts do #, except: [:show] do
    post "/like", to: "likes#like_toggle" 
    #posts라는 것 속에 comment 기능을 넣을 것이기 때문에 여기에 추가 
    resources :comments, only: [:index, :show, :create, :destroy]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end