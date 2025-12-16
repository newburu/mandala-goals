require "test_helper"

class Users::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "guest user data is transferred upon registration" do
    # 1. Sign in as a guest user
    post guest_sign_in_url
    guest_user = User.find_by(guest: true)
    assert guest_user

    # 2. Create some data as the guest user
    guest_user.annual_themes.create(year: 2024, kanji: "test")

    # 3. Register as a new user
    assert_difference "User.count", 0 do # A new user is created, and the guest user is deleted
      post user_registration_url, params: { user: { email: "new@example.com", password: "password", password_confirmation: "password" } }
    end

    # 4. Assert that the data has been transferred
    new_user = User.find_by(email: "new@example.com")
    assert new_user
    assert_equal 1, new_user.annual_themes.count
    assert_equal "test", new_user.annual_themes.first.kanji

    # 5. Assert that the guest user has been deleted
    assert_raises(ActiveRecord::RecordNotFound) { User.find(guest_user.id) }
  end
end
