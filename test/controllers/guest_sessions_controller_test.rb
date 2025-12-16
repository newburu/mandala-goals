require "test_helper"

class GuestSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should create guest user and sign them in" do
    assert_difference "User.count", 1 do
      post guest_sign_in_url
    end
    assert_redirected_to annual_themes_url
    assert User.last.guest?
  end
end
