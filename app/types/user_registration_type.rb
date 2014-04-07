class UserRegistrationType < User
  include ApplicationType

  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  permit :email, :password, :password_confirmation
end
