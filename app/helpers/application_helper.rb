require "holidays"

module ApplicationHelper
  def date_text_color_class(date)
    is_holiday = Holidays.on(date, :jp).any?
    if date.sunday? || is_holiday
      "text-red-600"
    elsif date.saturday?
      "text-blue-600"
    else
      "text-gray-900"
    end
  end

  def calendar_date_class(date)
    return "bg-indigo-600 text-white" if date.today?

    base_color = date_text_color_class(date)
    # 平日の場合のみデフォルト色を調整（カレンダーでは薄めのグレーが好ましいため）
    base_color = "text-gray-700" if base_color == "text-gray-900"

    "#{base_color} hover:bg-indigo-600 hover:text-white"
  end
end
