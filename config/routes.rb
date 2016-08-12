Rails.application.routes.draw do
  devise_for :user

  resources :teachers
  resources :visitors, only: :index
  resources :reports do
    get :subjects, on: :collection
  end
  resources :students do
    get :subjects
  end
end
