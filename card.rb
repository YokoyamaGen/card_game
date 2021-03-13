class Card
  attr_reader :suit, :num
  
  def initialize(suit:, num:)
    @suit = suit
    @num = num
  end

  def card_info
    "#{@suit}#{@num}"
  end
end
