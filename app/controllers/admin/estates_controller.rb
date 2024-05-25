module Admin
  class EstatesController < ApplicationController
    layout 'admin'
    def index
      @estates = Estate.all
    end

    def new
      @estate = Estate.new
      @estate.users.build
    end

    def show
      @estate = Estate.find(params[:id])
    end

    def create
      @estate = Estate.new(estate_params)
      respond_to do |format|
        if @estate.save
          flash[:notice] = 'estate was successfully created.'
          redirect_to @estate
        else
          puts "estate error creating #{@estate.errors.messages}"
          render "new"
        end
      end
    end


    private

    def estate_params
      params.require(:estate).permit(:name, :city, :state, :street, :avatar,
      users_attributes: [:id,:email, :firstname, :lastname, :admin])
    end
  end
end
