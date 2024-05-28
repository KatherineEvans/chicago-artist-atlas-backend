class Users::SessionsController < Devise::SessionsController
  include RackSessionFix
  before_action :sign_in_params, only: :create
  before_action :load_user, only: :create
  # sign in
  def create
    if @user.valid_password?(sign_in_params[:password])
      sign_in "user", @user
      profile = Profile.find_by(user_id: @user.id)
      url = profile && profile.headshot_url ? profile.headshot_url : nil;
      user = {
        first_name: @user.first_name, 
        last_name: @user.last_name,
        email: @user.email,
        id: @user.id,
        theater_id: @user.theater_id,
        headshot_url: url,
        generated_at: DateTime.now
      }
      render json: {
        messages: "Signed In Successfully",
        is_success: true,
        data: {user: user}
      }, status: :ok
    else
      render json: {
        messages: "Signed In Failed - Unauthorized",
        is_success: false,
        data: {}
      }, status: :unauthorized
    end
  end

  private
    def sign_in_params
      params.require(:user).permit :email, :password
    end

    def load_user
      @user = User.find_for_database_authentication(email: sign_in_params[:email])
      if @user
        
        return @user
      else
        render json: {
          messages: "The email and password you entered did not match our records. Please double check and try again.",
          is_success: false,
          data: {}
        }, status: :unauthorized
      end
    end
end
