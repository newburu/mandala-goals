class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super do |resource|
      if (omniauth_data = session["devise.omniauth_data"])
        resource.email = omniauth_data["info"]["email"]
      end
    end
  end

  def create
    super do |resource|
      if session[:guest_user_id]
        guest_user = User.find(session[:guest_user_id])
        guest_user.annual_themes.update_all(user_id: resource.id)
        guest_user.monthly_goals.update_all(user_id: resource.id)
        guest_user.daily_tasks.update_all(user_id: resource.id)
        guest_user.reflections.update_all(user_id: resource.id)
        guest_user.destroy
        session[:guest_user_id] = nil
      end
    end
  end

  protected

  def build_resource(hash = {})
    super(hash)
    if (omniauth_data = session["devise.omniauth_data"])
      resource.provider = omniauth_data["provider"]
      resource.uid = omniauth_data["uid"]
    end
  end
end
