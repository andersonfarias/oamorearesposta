module ApplicationHelper
  def date_format date
    date.strftime(t "date.formats.default") if !date.nil?
  end
end
