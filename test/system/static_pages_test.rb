require "application_system_test_case"

class StaticPagesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "visiting the top page as a guest" do
    visit root_url

    assert_selector "h1", text: "マンダラチャートで目標を達成しよう"
    assert_link "今すぐはじめる", href: new_user_registration_path
    assert_link "ログイン", href: new_user_session_path
  end

  test "visiting the top page as a logged in user" do
    sign_in users(:one)
    visit root_url

    assert_text "年間目標"
  end
end
