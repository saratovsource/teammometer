TeamMometer::Application.routes.draw do
  if Rails.env.development?
    mount UserMailView => 'user_mail_view'
    mount SurveyMailView => 'survey_mail_view'
  end

  # Api
  namespace :api do
    resources :interview_forms, only: [:show, :update]
    resources :personal_qualities, only: [:index]
    resources :surveys do
      resource :report, only: [:show]
    end
  end

  # Web
  scope module: :web do
    root to: "welcome#index"
    get 'templates/*template', to: 'templates#show', as: :template
    resources :interviews, only: [:show]
    resources :surveys
    resource  :session,    only: [:create, :destroy]
    resources :users,      only: [:new, :create] do
      member do
        get :confirm
      end
    end
  end
end
