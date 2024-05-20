class HomeController < ApplicationController
  def index
    @announcements = Announcement.all
    @bills = current_user.bills

  end
end
