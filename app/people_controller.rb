require 'format_reader'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    content = FormatReader.new
    return content.read(params)
  end

  private

  attr_reader :params
end
