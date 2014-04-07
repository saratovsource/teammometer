# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { generate :email }
    password { generate :string }
    password_confirmation { password }

    factory :authenticated_user do
      state :enabled
    end
  end
end
