
class VisitorsController < ApplicationController
  def index
    @visitors=Visitor.all
  end

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(visitor_params)
    if @visitor.save
      flash[:success] = "Object successfully created"
      redirect_to @visitor
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def visitor_params
    params.require(:visitor).permit(:name,:gender)
  end



end
