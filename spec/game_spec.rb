require 'game'

describe Game do
  let(:game) { Game.new(Player.new, Player.new) }

  it "holds a deck" do
    expect(game.deck).to_not be_nil
  end

  describe "#deck" do
    it "is a Deck object" do
      expect(game.deck).to be_a(Deck)
    end
  end

  describe '#turn' do
    it "returns the current player" do
      expect(game.turn).to be_a(Player)
    end
  end

  describe "#change_turn" do

    it "returns a new player" do
      current_player = game.turn
      game.change_turn
      expect(game.turn).to_not eq(current_player)
    end
  end

  describe '#amount' do
    it "returns current amount" do
      expect(game.amount).to be_an(Integer)
    end

    it "can change amount" do
      current_amount = game.amount
      game.amount += 5
      expect(game.amount).to eq(current_amount + 5)
    end

  end

end
