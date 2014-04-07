class Web::UsersController < Web::ApplicationController
  def new
    @user = UserRegistrationType.new(params.fetch(:user, {}))
    respond_with @user
  end

  def create
    @user = UserRegistrationType.new(params.fetch(:user, {}))
    @user.assign_attributes(params.fetch(:user, {}))
    @user.generate_confirmation_token!
    unless @user.save
      flash_now!(:error)
    end
    respond_with @user, location: root_path
  end

  def confirm
    @user = User.disabled.where(confirmation_token: params[:id]).first
    if @user.confirm
      sign_in(@user)
    else
      flash_now!(:error)
    end
    redirect_to root_path
  end
end
