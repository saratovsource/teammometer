TeamMometer::Application.routes.draw do
  mount UserMailView => 'user_mail_view' if Rails.env.development?

  # Api
  namespace :api do

  end

  # Web
  scope module: :web do
    root to: "welcome#index"
    resources :surveys
    resource  :session, only: [:create, :destroy]
    resources :users,   only: [:new, :create] do
      member do
        get :confirm
      end
    end
  end
end
