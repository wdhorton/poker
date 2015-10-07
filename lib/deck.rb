require_relative 'cards'

class Deck
  CARD_VALUES = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

  attr_accessor :cards

  def initialize
    fill_deck
  end

  def fill_deck
    self.cards  = []
    suits = ["Spades","Clubs","Diamonds","Hearts"]

    suits.each do |suit|
      Deck::CARD_VALUES.each do |value|
        cards << Card.new(value, suit)
      end
    end

    cards
  end

  def shuffle
    @cards = cards.shuffle
  end

  def deal(n)
    dealt_cards = []
    n.times { dealt_cards << cards.shift }
    dealt_cards
  end

end
