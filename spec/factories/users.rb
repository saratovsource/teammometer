# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { generate :email }
    password { generate :string }
    password_confirmation { password }

    factory :authenticated_user, aliases: [:interviewer] do
      state :enabled
    end

    factory :requested_user do
      confirmation_token { generate :confirmation_token }
    end
  end
end
