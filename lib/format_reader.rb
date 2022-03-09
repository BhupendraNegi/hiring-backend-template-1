class FormatReader
  require 'date_format'
  require 'city_format'

  def read(content)

    # Initializing
    final_format = []
    date_format = DateFormat.new
    city_format = CityFormat.new

    # handling dolor formate
    dollar_format = content[:dollar_format].split("\n").drop(1)
    percent_format = content[:percent_format].split("\n").drop(1)

    dollar_format.each do |item|
      ordered_item = item.split(' $ ').values_at *[2,3,0,1].drop(1)
      ordered_item[1] = city_format.full_name(ordered_item[1])
      order = [1,0,2]
      ordered_item[2] = date_format.convert(ordered_item[2], order)
      final_format << ordered_item.join(", ")
    end

    # handling percentage format
    percent_format.each do |item|
      ordered_item = item.split(' % ')
      ordered_item[1] = city_format.full_name(ordered_item[1])
      order = [1,2,0]
      ordered_item[2] = date_format.convert(ordered_item[2], order)
      final_format << ordered_item.join(", ")
    end

    return final_format.sort
  end
end
