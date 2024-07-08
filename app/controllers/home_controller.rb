class HomeController < ApplicationController
  def index
    @announcements = Announcement.all
    @bills = Bill.all
    @visitors = Visitor.all
    if current_user
      if current_user.family.present?
        @family_members_count = current_user.family.users.count
      else
        @family_members_count = 0
      end
    end

    @pass_in_code = current_user.pass_in_code.to_s
    @qr_code = RQRCode::QRCode.new(@pass_in_code)
    @qr_png = @qr_code.as_png(size: 120).to_data_url
  end
end
