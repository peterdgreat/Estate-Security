module Admin
  class AnnouncementsController < ApplicationController
    layout 'admin'
    def index
      @announcements = Announcement.all
    end
  end

end
