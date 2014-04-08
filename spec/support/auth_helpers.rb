module AuthHelpers
  def sign_in_as_user
    user = create :authenticated_user
    sign_in(user)
  end

  def sign_in(user)
    controller.sign_in user
  end

  def current_user
    controller.current_user
  end

  def signed_in?
    controller.signed_in?
  end
end
