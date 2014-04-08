class Web::SessionsController < Web::ApplicationController
  def create
    @session_type = SessionType.new(params[:session_type])
    if @session_type.valid?
      sign_in @session_type.user
      flash!(:success)
    else
      flash!(:error)
    end
    redirect_to root_path
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
