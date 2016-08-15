Rails.application.routes.draw do

  devise_for :user

  root to: 'visitors#index'

  resources :teachers do
    get :subjects
  end
  resources :visitors, only: :index

  get 'report/subjects', to: 'reports#subjects',
                         as: :report_subjects

  get 'report/payments', to: 'reports#payments',
                         as: :report_payments

  get 'report/students_datatable', to: 'reports#students_datatable',
                                   as: :students_datatable
  resources :students do
    get :subjects
  end
end
