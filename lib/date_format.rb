class DateFormat
  require 'date'
  def convert(date,order)
    date = date.split('-').values_at *order
    return date.map(&:to_i).join('/')
  end
end
