Rails.application.routes.draw do
 
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do

     get '/' => 'homes#top'
     
     get '/search', to: 'searches#search'

     resources :users, only: [:index, :show]

     resources :posts, only: [:index, :show] do
       resources :post_comments, only: [:destroy]
      end
     
  end




  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do

     get root to: 'homes#top'
     
     get '/search', to: 'searches#search'

     resources :users, only: [:index, :show, :edit, :update, :destroy] do
       member do
         get 'withdraw'
       end
     end
     resources :posts do
       resource :favorites, only: [:create, :destroy]
       resources :post_comments, only: [:create, :destroy]
     end

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
