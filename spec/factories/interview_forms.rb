# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :interview_form do
    respondent { association :respondent }
    survey { association :new_survey }
    token { generate :token }

    factory :completed_interview do
      personal_quality_list { 10.times.map{ |i| i = generate(:string) } }
    end
  end
end
