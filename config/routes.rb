Rails.application.routes.draw do
  devise_for :usuarios, controllers: { sessions: "usuarios/sessions" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "home#index"
  get "perform_search", to: "home#perform_search"
  resources :postagens
  resources :comunidades
  resources :postagens do
    resources :comentarios
    resources :reacoes
  end
  resources :comunidades do
    member do
      post :join
    end
  end

  resources :notificacoes, only: [ :index ] do
    member do
      patch :marcar_como_lida
    end
  end

  get "social_community_post/new", to: "social_community_post#new", as: :new_social_content
  post "social_community_post/create_community", to: "social_community_post#create_community", as: :create_community
  post "social_community_post/create_post", to: "social_community_post#create_post", as: :create_post

  get "search", to: "home#search", as: :search
  post "send_friend_request/:id", to: "home#send_friend_request", as: :send_friend_request
end
