require "application_system_test_case"

class ReflectionsTest < ApplicationSystemTestCase
  setup do
    @reflection = reflections(:one)
    login_as users(:one)
  end

  test "visiting the index" do
    visit reflections_url(locale: :en)
    assert_text I18n.l(@reflection.date, locale: :en)

    visit reflections_url(locale: :ja)
    assert_text I18n.l(@reflection.date, locale: :ja)
  end

  test "visiting the show page" do
    visit reflection_url(@reflection, locale: :en)
    assert_text I18n.l(@reflection.date, locale: :en)

    visit reflection_url(@reflection, locale: :ja)
    assert_text I18n.l(@reflection.date, locale: :ja)
  end
end
