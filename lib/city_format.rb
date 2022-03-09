class CityFormat
  def full_name(city)
    case city
    when 'LA'
      'Los Angeles'
    when 'NYC'
      'New York City'
    when 'ATL'
      'Atlanta'
    when 'New York'
      'New York City'
    else
      city
    end
  end
end
