class UserMailView < ApplicationMailView
  mail :confirmation_instructions do
    user = User.disabled.last
    generate user
  end
end
