require "application_system_test_case"

class DailyTasksTest < ApplicationSystemTestCase
  setup do
    @daily_task = daily_tasks(:one)
    login_as users(:one)
  end

  test "visiting the index" do
    visit daily_tasks_url(locale: :en)
    assert_text I18n.l(Date.current, locale: :en)

    visit daily_tasks_url(locale: :ja)
    assert_text I18n.l(Date.current, locale: :ja)
  end
end
