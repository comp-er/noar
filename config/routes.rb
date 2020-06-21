Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
	#상세보기에 해당하는 show함수 빼고 다 라우트 규칙 생성
  resources :posts, except: [:show] do
    post "/like", to: "likes#like_toggle"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end