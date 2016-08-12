Rails.application.routes.draw do
  devise_for :user

  resources :students do
    get :subjects
  end
end
