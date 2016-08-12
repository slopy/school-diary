Rails.application.routes.draw do
  devise_for :user

  root to: 'visitors#index'

  resources :teachers do
    get :subjects
  end
  resources :visitors, only: :index
  resources :reports

  get 'report/subjects', to: 'reports#subjects',
                         as: :report_subjects

  resources :students do
    get :subjects
  end
end
