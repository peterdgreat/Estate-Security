class HomeController < ApplicationController
  def index
    @announcements = Announcement.all
    @bills = Bill.all

  end
end
