require_relative 'hand'

class Player

  STARTING_POT = 20

  attr_accessor :pot
  attr_accessor :hand

  def initialize
    @pot = STARTING_POT
    @hand = Hand.new
  end

  def render_hand
    puts hand
  end

  def discard(indexes)
    indexes.each do |index|
      hand.cards.delete_at(index)
    end
    nil
  end

  def see(n)
    @pot -= n
  end

  def increase(n, current_bet)
    @pot -= (n + current_bet)
    n
  end

  def fold
    hand.empty_hand
  end

  def prompt_discard
    render_hand
    puts "Please enter the index of cards to discard"
    indexes = gets.chomp.split(',').map(&:to_i)
    discard(indexes)
    indexes.length
  end

  def take_bet(current_bet)
    render_hand
    puts "fold, see, or raise?"
    puts "(f/s/r)"
    input = gets.chomp
    case input
    when "f"
      fold
      "fold"
    when "s"
      see(current_bet)
      "see"
    when "r"
      puts "raise by how much?"
      amount = gets.chomp.to_i
      increase(amount, current_bet)
    end
  end

end
