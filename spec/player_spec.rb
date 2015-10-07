require 'player'

describe Player do
  let(:player) { Player.new }

  it "has a hand" do
    expect(player.hand).to_not be_nil
  end

  describe "#hand" do
    it "is a hand" do
      expect(player.hand).to be_an(Hand)
    end
  end

  describe "#pot" do
    it "is a number" do
      expect(player.pot).to be_an(Integer)
    end

    it "is a positive number" do
      expect(player.pot).to be >= 0
    end

    it "can change in value" do
      change = player.pot + 1
      player.pot += 1
      expect(player.pot).to eq(change)
    end
  end

  describe "#fold" do
    it "should empty hand" do
      expect(player.hand.cards).to eq([])
    end
  end

  describe "#discard" do

    it "should remove cards from hand" do
      player.hand.cards << Card.new('2', "Hearts")
      player.hand.cards << Card.new('3', "Spades")
      player.hand.cards << Card.new('4', "Hearts")
      player.hand.cards << Card.new('5', "Spades")
      player.hand.cards << Card.new('6', "Spades")
      card_count = player.hand.cards.count
      player.discard([0,1])
      expect(player.hand.cards.count).to eq(card_count - 2)
    end
  end

  describe "#see" do
    it "moves money from your pot" do
      current_pot = player.pot
      player.see(1)
      expect(current_pot).to_not eq(player.pot)
    end
  end


end
