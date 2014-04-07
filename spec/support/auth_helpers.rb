module AuthHelpers
  def sign_in_as_user
    user = create :authenticated_user
    controller.sign_in user
  end
end
