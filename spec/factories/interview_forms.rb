# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :interview_form do
    respondent
    survey
    token { generate :token }
  end
end
