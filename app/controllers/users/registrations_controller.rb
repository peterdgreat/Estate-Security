# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # before_action :authenticate_user!
  before_action :check_if_admin_or_family, only: [:new,:create]
  skip_before_action :require_no_authentication, only: [:new, :create]

  # GET /resource/sign_up
  def new
   if current_user
    puts (current_user.email)
   end
    @user = User.new
    @user.cars.build
  end

  # POST /resource
  def create
    temp_password = Devise.friendly_token.first(8)
    @user = User.new(user_params)
    unless @user.admin? || @user.security?
      if current_user
        if current_user.admin?
          @family = Family.create
          @user.family = @family
        else
          @user.family = current_user.family
        end
      end
    end

    if @user.save
      flash.now[:notice] = "#{@user.firstname}  Created!"
    else
      puts "err #{@user.errors.messages}"
      flash.now[:notice] = 'Error Occured!'
      render :new
    end
  end

  def show
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected
  private

      def user_params
        params.require(:user).permit(:email,:firstname,:lastname, :admin, :security,
        cars_attributes: [:color,:plate_number,:brand,:model])
      end

      def check_if_admin_or_family
        if current_user
        unless current_user.admin? || current_user.family.present?
          redirect_to root_path, alert: "Only Admins or Family member can create new users"
        end
      end
      end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
