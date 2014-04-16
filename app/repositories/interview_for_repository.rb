module InterviewForRepository
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :web, -> { where.not(token: nil) }
    scope :active, ->( token ){ web.initial.where(token: token) }
  end
end
