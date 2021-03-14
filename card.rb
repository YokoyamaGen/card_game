class Card
  attr_reader :suit, :num
  
  def initialize(mark:, num:)
    @mark = mark
    @num = num
  end

  def card_info
    "#{@mark}#{@num}"
  end
end
