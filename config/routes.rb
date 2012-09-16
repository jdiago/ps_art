PsArt::Application.routes.draw do
  resources :users, except: :show

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  root to: 'home#index'
end
