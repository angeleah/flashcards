module ApplicationHelper
  def local_display_date(timestamp)
    timestamp.strftime("%a %b #{timestamp.day.ordinalize},%l:%M %p")
  end
end
