class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to annual_themes_path
    end
  end

  def terms
  end

  def privacy_policy
  end
end
