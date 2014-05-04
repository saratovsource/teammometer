# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey do
    title { generate :string }
    interviewer

    factory :new_survey, class: 'NewSurveyType' do
      respondents_attributes {
        [ attributes_for(:respondent),
          attributes_for(:respondent),
          attributes_for(:respondent) ]
      }

      factory :completed_survey do
        interview_forms {|i| [
          i.association( :completed_interview ),
          i.association( :completed_interview ),
          i.association( :completed_interview ),
          i.association( :completed_interview )
        ]}

        factory :active_survey do
          state { :started }
        end
      end

    end
    trait :with_qualities do
      personal_qualities { [ generate(:personal_quality),
                                generate(:personal_quality),
                                generate(:personal_quality) ] }
    end
  end
end
