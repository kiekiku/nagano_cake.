Rails.application.routes.draw do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

root to: 'public/homes#top'
  namespace :admin do
    root to: 'homes#top'
    resources :orders
    resources :customers
    resources :genres
    resources :items
  end

  scope module: :public do
    delete 'cart_items' => 'cart_items#destroy_all'
    get 'about' => 'homes#about'
    resources :addresses
    resources :orders
    resources :cart_items
    resources :customers
    resources :items
    resources :homes

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
