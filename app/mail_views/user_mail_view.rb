class UserMailView < ApplicationMailView
  mail :confirmation_instructions do
    user = build :requested_user
    generate user
  end
end
