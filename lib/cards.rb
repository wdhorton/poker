class Card

  attr_reader :value
  attr_reader :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    value + suit[0]
  end

end
