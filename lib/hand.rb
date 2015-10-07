require_relative 'deck'

class Hand
  HANDS = [:straight_flush, :four, :full_house, :flush, :straight, :three, :two_pair, :pair, :high_card].reverse

  attr_accessor :cards

  def initialize
    @cards = []
  end

  def empty_hand
    @cards = []
  end

  def to_s
    cards.each do |card|
      puts card
    end
    nil
  end

  def contains_n?(n)
    counts = Hash.new(0)
    cards.each do |card|
      counts[card.value] += 1
    end

    counts.values.include?(n)
  end

  def contains_pair?
    contains_n?(2)
  end

  def contains_three?
    contains_n?(3)
  end

  def two_pair?
    counts = Hash.new(0)
    cards.each do |card|
      counts[card.value] += 1
    end

    counts.values.select { |value| value == 2 }.length == 2
  end

  def straight?
    (Deck::CARD_VALUES + ['A']).each_cons(5) do |array|
      return true if array.sort == cards.map { |card| card.value }.sort
    end
    false
  end

  def flush?
    counts = Hash.new(0)
    cards.each do |card|
      counts[card.suit] += 1
    end

    counts.values.max == 5
  end

  def full_house?
    counts = Hash.new(0)
    cards.each do |card|
      counts[card.value] += 1
    end
    counts.values.include?(2) && counts.values.include?(3)
  end

  def <=>(other_hand)
    Hand::HANDS.index(determine_hand) <=> Hand::HANDS.index(other_hand.determine_hand)
  end

  def determine_hand
    if straight? && flush?
      return :straight_flush
    elsif contains_n?(4)
      return :four
    elsif full_house?
      return :full_house
    elsif flush?
      return :flush
    elsif straight?
      return :straight
    elsif contains_three?
      return :three
    elsif two_pair?
      return :two_pair
    elsif contains_pair?
      return :pair
    else
      return :high_card
    end
  end
end
