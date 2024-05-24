class EstatesController < ApplicationController

  def new
    @estate = Estate.new
    @estate.users.build
  end

  def show
    @estate = Estate.find(params[:id])
  end



end
