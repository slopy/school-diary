Rails.application.routes.draw do
  devise_for :user

  resources :teachers
  resources :visitors, only: :index
  resources :students do
    get :subjects
  end
end
