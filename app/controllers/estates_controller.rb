class EstatesController < ApplicationController

  def index
    @estates = Estate.all
  end

  def new
    @estate = Estate.new
  end

  def show
    @estate = Estate.find(params[:id])
  end


  def create
    @estate = Estate.new(estate_params)
    respond_to do |format|
      if @estate.save
        flash[:notice] = 'estate was successfully created.'
        format.html { redirect_to(@estate) }
        format.xml { render xml: @estate, status: :created, location: @estate }
      else
        format.html { render action: "new" }
        format.xml { render xml: @estate.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def estate_params
    params.require(:estate).permit(:name,:city, :state, :street )
  end



end
