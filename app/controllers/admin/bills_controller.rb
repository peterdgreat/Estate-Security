module Admin
  class BillsController < ApplicationController
    layout 'admin'
    def index
      @bills = Bill.all
    end

    def new
      @bill = Bill.new
    end

    def create
      @bill = Bill.new(bill_params)
      if @bill.save
        flash[:success]= 'Bill was successfully created.'
        redirect_to bills_path
      else
        flash[:error] = 'Something went wrong'
        render :new
      end
    end

    def update
      if @bill.update(bill_params)
        flash[:success] = "bill was successfully updated"
        redirect_to admin_bill_path(@bill)
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    if @bill.destroy
      flash[:success] = 'bill was successfully deleted.'
      redirect_to admin_bills_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to bills_url
    end
  end

    private

    def bill_params
      params.require(:bill).permit(:title, :amount)
    end
  end
end
