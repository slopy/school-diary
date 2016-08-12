Rails.application.routes.draw do
  devise_for :user

  resources :teachers
  resources :visitors, only: :index
  resources :reports

  get 'report/subjects', to: 'reports#subjects',
                         as: :report_subjects

  resources :students do
    get :subjects
  end
end
