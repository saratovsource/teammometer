TeamMometer::Application.routes.draw do
  mount UserMailView => 'user_mail_view' if Rails.env.development?
  scope module: :web do
    root to: "welcome#index"
    resources :users, only: [:new, :create] do
      member do
        get :confirm
      end
    end
  end
end
