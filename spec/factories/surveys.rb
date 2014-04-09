# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey do
    title { generate :string }
    interviewer

    factory :new_survey do
      survey_participants do |a|
        [ a.association( :survey_participant ),
          a.association( :survey_participant ),
          a.association( :survey_participant ) ]
      end
    end
  end
end
