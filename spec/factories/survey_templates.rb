# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey_template, :class => 'Survey::Template' do
    title                       { generate :string }
    attraction_question         { generate :string }
    referention_question        { generate :string }
    personal_qualities_question { generate :string }
  end
end
