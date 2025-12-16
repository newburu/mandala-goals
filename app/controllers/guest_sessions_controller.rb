class GuestSessionsController < ApplicationController
  def create
    @user = User.find_or_create_by!(email: "guest@example.com") do |user|
      user.name = "Guest User"
      user.password = Devise.friendly_token[0, 20]
      user.guest = true
    end
    sign_in(@user)
    session[:guest_user_id] = @user.id
    redirect_to annual_themes_path, notice: "ゲストユーザーとしてログインしました。"
  end
end
