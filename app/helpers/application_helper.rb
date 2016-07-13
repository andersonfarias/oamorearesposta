module ApplicationHelper
  def date_format date
    date.strftime(t "date.formats.default")
  end
end
