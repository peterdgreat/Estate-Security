class UsersController < ApplicationController
      before_action :authenticate_user!
      before_action :check_if_admin_or_family, only: [:new,:create]

      def new
          @user = User.new
      end

      def create
          @user = User.new(user_params)
          @user.password= Devise.friendly_token.first(8)
          if current_user.admin?
              @family = Family.create
              @user.family = @family
            else
              @user.family = current_user.family
          end

          if @user.save?
            
            redirect_to @user_path
          else
            render 'new'
          end
      end

      private

      def user_params
        params.require(:user).permit(:email,:firstname,:lastname, :password, :password_confirmation)
      end

      def check_if_admin_or_family
        unless user.admin? || current_user.family.present?
          redirect_to root_path, alert: "Only Admins or Family member can create new users"
        end
      end
end
