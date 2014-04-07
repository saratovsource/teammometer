module UserRepository
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :web, -> {with_states([:enabled])}
  end
end
