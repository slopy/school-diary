Rails.application.routes.draw do
  devise_for :user

  root to: 'visitors#index'

  resources :teachers
  resources :visitors, only: :index
  resources :reports

  get 'report/subjects', to: 'reports#subjects',
                         as: :report_subjects

  resources :students do
    get :subjects
  end
end
