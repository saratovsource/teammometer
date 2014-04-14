# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey do
    title { generate :string }
    interviewer

    factory :new_survey do
      respondents_attributes {
        [ attributes_for(:respondent),
          attributes_for(:respondent),
          attributes_for(:respondent) ]
      }
    end
  end
end
