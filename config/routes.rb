Rails.application.routes.draw do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to: 'homes#top'
    get 'admin/order' => 'orders#show'
    #patch 'order_details' => 'order_details#update'
    resources :orders
    resources :order_details, :only => [:update]
    resources :customers
    resources :genres
    resources :items
  end

  scope module: :public do
    root to: 'homes#top'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    get 'about' => 'homes#about'
    get 'customers/my_page' => 'customers#show'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    get 'orders/conplete' => 'orders#conplete'
    post 'orders/confirm' => 'orders#confirm'
    resources :addresses
    resources :orders
    resources :cart_items, :only => [:index, :create, :update, :destroy]
    resources :customers, :only => [:index, :create, :edit, :update, :destroy]
    resources :items
    resources :homes

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
