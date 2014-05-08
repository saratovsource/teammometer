module ServeyRepository
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :web, -> {with_states([:enabled])}
    scope :ordered, -> { order(created_at: :desc) }
  end
end
