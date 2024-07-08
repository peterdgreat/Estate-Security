# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_if_family, only: [:new, :create]
  before_action :configure_account_update_params, only: [:update]

  skip_before_action :require_no_authentication, only: [:new, :create]

  # GET /users/sign_up
  def new
    @user = User.new
  end

  # POST /users
  def create
      temp_password = Devise.friendly_token.first(8)
      @user = User.new(user_params)
      @user.family = current_user.family
    end

    if @user.save
      flash.now[:notice] = "#{@user.firstname}  Created!"
    else
      puts "err #{@user.errors.messages}"
      flash.now[:notice] = 'Error Occurred!'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :admin, :security)
  end

  def check_if_family
    if current_user
      unless  current_user.family.present?
        redirect_to root_path, alert: "Only Admins or Family member can create new users"
      end
    end
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [
      cars_attributes: [:id, :color, :plate_number, :brand, :model, :_destroy]
    ])
  end

end
