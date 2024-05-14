require 'rqrcode'
class Users::UsersController < ApplicationController
  def index
    @users=User.all
  end
  def show
    @user = User.find(params[:id])
    @pass_in_code = @user.pass_in_code.to_s
    @qr_code = RQRCode::QRCode.new(@pass_in_code)
    @qr_png = @qr_code.as_png(size: 120).to_data_url

  end

end
