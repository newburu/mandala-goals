require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "guest user is created with guest attribute set to true" do
    user = User.create(guest: true)
    assert user.guest?
  end

  test "regular user is created with guest attribute set to false" do
    user = User.create(email: "test@example.com", password: "password")
    assert_not user.guest?
  end
end
