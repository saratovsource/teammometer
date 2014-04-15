TeamMometer::Application.routes.draw do
  mount UserMailView => 'user_mail_view' if Rails.env.development?

  # Api
  namespace :api do
    resources :surveys
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
