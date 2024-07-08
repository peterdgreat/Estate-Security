# app/controllers/cars_controller.rb
class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:new, :create]
  before_action :set_car, only: [:edit, :update, :destroy]

  # GET /users/:user_id/cars/new
  def new
    @car = @user.cars.build
  end

  # POST /users/:user_id/cars
  def create
    @car = @user.cars.build(car_params)
    if @car.save
      flash[:notice] = "Car added successfully"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Error adding car"
      render :new
    end
  end

  # GET /cars/:id/edit
  def edit
  end

  # PATCH/PUT /cars/:id
  def update
    if @car.update(car_params)
      flash[:notice] = "Car details updated successfully"
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "Error updating car details"
      render :edit
    end
  end

  # DELETE /cars/:id
  def destroy
    @car.destroy
    flash[:notice] = "Car deleted successfully"
    redirect_to user_path(current_user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:color, :plate_number, :brand, :model)
  end
end
