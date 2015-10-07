require 'byebug'
require_relative 'player'
require_relative 'deck'

class Game

  MINIMUM_BET = 2

  attr_accessor :amount
  attr_reader :deck

  def initialize(*players)
    @amount = 0
    @players = players
    @deck = Deck.new
  end

  def turn
    @players.first
  end

  def change_turn
    @players.rotate!
  end

  def play_round
    active_players = @players
    deck.shuffle
    deal_cards
    current_bet = MINIMUM_BET
    @players.each do |player|
      response = player.take_bet(current_bet)
      if response.is_a? Integer
        current_bet += response
        self.amount += current_bet
      elsif response == "fold"
        active_players.delete(player)
      elsif response == "see"
        self.amount += current_bet
      end
    end

    active_players.each do |player|
      card_number = player.prompt_discard
      player.hand.cards += deck.deal(card_number)
    end

    current_bet = MINIMUM_BET
    active_players.each do |player|
      response = player.take_bet(current_bet)
      if response.is_a? Integer
        current_bet += response
        self.amount += current_bet
      elsif response == "fold"
        active_players.delete(player)
      elsif response == "see"
        self.amount += current_bet
      end
    end

    best_hand = nil
    best_player = nil
    active_players.each do |player|
      best_hand ||= player.hand
      best_player ||= player
      if player.hand > best_hand
        best_hand = player.hand
        best_player = player
      end
    end

    best_player.pot += amount
  end

  def deal_cards
    @players.each{ |player| player.hand.cards = deck.deal(5)}
  end

  def round_over?
    @players.all? { |player| player.hand.cards.empty? }
  end
end
