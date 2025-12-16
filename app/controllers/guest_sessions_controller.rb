class GuestSessionsController < ApplicationController
  def create
    @user = User.create!(
      name: "Guest User",
      email: "guest_#{Time.now.to_i}#{rand(1000)}@example.com",
      password: Devise.friendly_token[0, 20],
      guest: true
    )
    sign_in(@user)
    session[:guest_user_id] = @user.id
    redirect_to annual_themes_path, notice: "ゲストユーザーとしてログインしました。"
  end
end
