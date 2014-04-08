class SessionType
  include ApplicationTypeWithoutActiveRecord

  attribute :email,     String
  attribute :password,  String

  validates :email, presence: true, email: true
  validates :password, presence: true

  validate :check_authenticate, if: :email

  def user
    ::User.enabled.where(email: email.mb_chars.downcase).first
  end

  private

  def check_authenticate
    unless user.try(:authenticate, password)
      errors.add(:password, :user_or_password_invalid)
    end
  end
end
