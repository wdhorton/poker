require 'deck'

describe Deck do
  let(:deck){ Deck.new }
  it "should have 52 cards by default" do
    expect(deck.cards.count).to eq(52)
  end

  it "should contain card objects" do
    expect(deck.cards.all?{ |el| el.class == Card }).to eq(true)
  end

  it "should contain 13 cards of each suit" do
    counts = {}
    suits = ["Diamonds", "Clubs", "Hearts", "Spades"]
    suits.each do |suit|
      counts[suit] = deck.cards.count{ |card| card.suit == suit }
    end
    expect(counts).to eq({"Diamonds" => 13, "Clubs" => 13, "Hearts" => 13, "Spades" => 13})
  end

  it "should have 4 of each value" do
    counts = {}
    Deck::CARD_VALUES.each do |value|
      counts[value] = deck.cards.count { |card| card.value == value }
    end
    expect(counts).to eq({"A"=>4,"2"=>4,"3"=>4,"4"=>4,"5"=>4,"6"=>4,"7"=>4,
                          "8"=>4,"9"=>4,"10"=>4,"J"=>4,"Q"=>4,"K"=>4})
  end

  describe "#shuffle" do
    it "should shuffle the deck" do
      old_deck = deck.cards
      expect(deck.shuffle).to_not eq(old_deck)
    end

    it "should return cards" do
      expect(deck.shuffle).to be_an(Array)
    end

    it "should contain cards" do
      expect(deck.shuffle.first).to be_a(Card)
    end

    it "should contain the same number of cards as the deck" do
      expect(deck.shuffle.count).to eq(deck.cards.count)
    end

  end

  describe "#deal" do
    it "should take a number of cards from the deck" do
      cardcount = deck.cards.count
      deck.deal(5)
      expect(deck.cards.count).to eq(cardcount - 5)
    end

    it "should return the correct number of cards" do
      num = deck.deal(5).count
      expect(num).to eq(5)
    end

    it "should return an array of cards" do
      expect(deck.deal(5)).to be_an(Array)
    end

    it "should only have cards in the array" do
      expect(deck.deal(5).all? { |card| card.is_a?(Card) } ).to be true
    end

  end

end
