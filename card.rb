class Card
  attr_reader :num
  
  def initialize(mark:, num:)
    @mark = mark
    @num = num
  end

  def card_info
    "#{@mark}#{@num}"
  end
end
