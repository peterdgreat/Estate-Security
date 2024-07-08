# app/controllers/admins/registrations_controller.rb
class Admins::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_admin!, only: [:new, :create]
  skip_before_action :require_no_authentication, only: [:new, :create]

  # GET /admins/users/new
  def new
    @user = User.new
  end

  # POST /admins/users
  def create
    @user = User.new(user_params)

    if current_user&.admin?
      @family = Family.create
      @user.family = @family
    end

    if @user.save
      flash[:notice] = "#{@user.firstname} Created!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Error Occurred!'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname)
  end

  def authenticate_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: "Only Admins can create new users"
    end
  end
end
