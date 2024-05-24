module Admin
  class ApplicationController < ::ApplicationController
    before_action :authenticate_user!
    before_action :admin_only

    private

    def admin_only
      redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
    end
  end
end
