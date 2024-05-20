class BillsController < ApplicationController
  def index
    @bills = current_user.bills
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = current_user.bills.build(bill_params)
    if @bill.save
      redirect_to bills_path, notice: 'Bill was successfully created.'
    else
      render :new
    end
  end

  private

  def bill_params
    params.require(:bill).permit(:title, :amount)
  end
end
