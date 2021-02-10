class Api::V1::SessionsController < ApiController
  def create
    user = login(session_params[:email], session_params[:password])
    # if user
    #   redirect_back_or_to root_path
    #   flash[:success] = 'ログインしました。'
    # else
    #   flash.now[:danger] = 'ログインに失敗しました。'
    #   render action: 'new'
    # end
  end

  private

  def session_params
    params.fetch(:session, {}).permit(:email, :password)
  end

  def form_authenticity_token; end
end
