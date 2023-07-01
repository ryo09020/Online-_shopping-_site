Rails.application.routes.draw do

  namespace :admin do
    get 'homes' => 'homes#top'
    resources :customers, only:[:index ,:show, :edit, :update]
    resources :items, only:[:index ,:show, :edit, :new,:create ,:update]
    resources :genres, only:[:index, :edit, :create,:update]
  end
  
  scope module: :public do
    resource :customers, only:[:show, :edit ,:update] do
      get :quit
      patch :withdrawal
    end
    resources :items, only:[:index,:show]
  end
root to: "public/homes#top"
get '/about' => 'public/homes#about'
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end