module InterviewForRepository
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :web, -> { where.not( token: nil ) }
    scope :active, ->( token ){ web.initial.where( token: token ) }
    scope :in_active_survey, ->{ includes( :survey ).where( surveys: { state: 'started' } ) }
  end
end
