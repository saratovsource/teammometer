class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, email: true
  has_secure_password

  state_machine initial: :disabled do
    state :enabled
    state :disabled

    event :enable do
      transition disabled: :enabled
    end

    event :disable do
      transition enabled: :disabled
    end
  end

  include UserRepository

  def generate_confirmation_token!
    self.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirm
    self.confirmation_token = nil
    enable
  end

  def guest?
    false
  end
end
