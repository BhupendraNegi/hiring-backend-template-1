class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    dollar_format = params[:dollar_format].split("\n").drop(1)
    percent_format = params[:percent_format].split("\n").drop(1)
    final_format = []
    dollar_format.each do |item|
      ordered_item = item.split(' $ ').values_at *[2,3,0,1].drop(1)
      if ordered_item[1] == 'LA'
        ordered_item[1] = 'Los Angeles'
      elsif ordered_item[1] == 'NYC'
        ordered_item[1] = 'New York City'
      end
      date = ordered_item[2].split('-').values_at *[1,0,2]
      ordered_item[2] = date.map(&:to_i).join('/')
      final_format << ordered_item.join(", ")
    end

    percent_format.each do |item|
      ordered_item = item.split(' % ')
      date = ordered_item[2].split('-').values_at *[1,2,0]
      ordered_item[2] = date.map(&:to_i).join('/')
      final_format << ordered_item.join(", ")
    end
    final_format.sort
  end

  private

  attr_reader :params
end
