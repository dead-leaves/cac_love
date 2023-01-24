Rails.application.routes.draw do
 
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do

     get '/' => 'homes#top'
     
     get '/search', to: 'searches#search'

     resources :users, only: [:index, :show, :destroy]

     resources :posts, only: [:index, :show, :destroy] do
       resources :post_comments, only: [:destroy]
      end
     
  end


   

  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

    devise_scope :user do
        post 'public/guest_sign_in', to: 'public/guestsessions#guest_sign_in'
    end

  scope module: :public do

     get root to: 'homes#top'
     
     

     resources :users, only: [:index, :show, :edit, :update, :destroy] do
       member do
         get 'withdraw'
         get 'favorites'
       end
     end
     resources :posts do
       resource :favorites, only: [:create, :destroy]
       resources :post_comments, only: [:create, :destroy]
     end
     
     get '/search', to: 'searches#search'
     
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
