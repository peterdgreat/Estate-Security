module Admin
  class AnnouncementsController < ApplicationController
    layout 'admin'
    def index
      @announcements = Announcement.all
    end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      flash[:success] = "Object successfully created"
      redirect_to @announcement
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def announcement_params
    params.require.permit(:title,:content)
  end


  end

end
