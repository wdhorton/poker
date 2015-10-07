require 'hand'

describe Hand do
  let(:hand) { Hand.new }

  it "should initially be empty" do
    expect(hand.cards).to eq([])
  end

  describe "#contains_pair?" do
    it "should be true if hand has a pair" do
      hand.cards << Card.new('2', "Hearts")
      hand.cards << Card.new('2', "Spades")
      expect(hand.contains_pair?).to be true
    end

    it "should be false if no pair in hand" do
      hand.cards << Card.new('5', "Hearts")
      hand.cards << Card.new('2', "Spades")
      expect(hand.contains_pair?).to be false
    end
  end

  describe "#contains_three?" do
    it "should be true if hand has three of a kind" do
      hand.cards << Card.new('2', "Hearts")
      hand.cards << Card.new('2', "Spades")
      hand.cards << Card.new('2', "Clubs")
      expect(hand.contains_three?).to be true
    end

    it "should be false if hand doesn't have three of a kind" do
      hand.cards << Card.new('2', "Hearts")
      hand.cards << Card.new('1', "Spades")
      hand.cards << Card.new('2', "Clubs")
      expect(hand.contains_three?).to be false
    end
  end

  describe "two_pair?" do
    it "should be true if hand has a two pair" do
      hand.cards << Card.new('2', "Hearts")
      hand.cards << Card.new('2', "Spades")
      hand.cards << Card.new('4', "Hearts")
      hand.cards << Card.new('4', "Spades")
      expect(hand.two_pair?).to be true
    end

    it "should be false if hand doesn't have two pair" do
      hand.cards << Card.new('2', "Hearts")
      hand.cards << Card.new('2', "Spades")
      hand.cards << Card.new('4', "Hearts")
      hand.cards << Card.new('3', "Spades")
      expect(hand.two_pair?).to be false
    end

  end

  describe "#straight?" do
    it "return true if it's a straight" do
      hand.cards << Card.new('2', "Hearts")
      hand.cards << Card.new('3', "Spades")
      hand.cards << Card.new('4', "Hearts")
      hand.cards << Card.new('5', "Spades")
      hand.cards << Card.new('6', "Spades")
      expect(hand.straight?).to be true
    end

    it "return false if it's not a straight" do
      hand.cards << Card.new('2', "Hearts")
      hand.cards << Card.new('3', "Spades")
      hand.cards << Card.new('A', "Hearts")
      hand.cards << Card.new('5', "Spades")
      hand.cards << Card.new('6', "Spades")
      expect(hand.straight?).to be false
    end
  end

  describe "#flush?" do
    it "returns true if all the same suit" do
      hand.cards << Card.new('2', "Spades")
      hand.cards << Card.new('3', "Spades")
      hand.cards << Card.new('A', "Spades")
      hand.cards << Card.new('5', "Spades")
      hand.cards << Card.new('6', "Spades")
      expect(hand.flush?).to be true
    end

    it "returns false if not all the same suit" do
      hand.cards << Card.new('2', "Spades")
      hand.cards << Card.new('3', "Spades")
      hand.cards << Card.new('A', "Hearts")
      hand.cards << Card.new('5', "Spades")
      hand.cards << Card.new('6', "Spades")
      expect(hand.flush?).to be false
    end
  end

  describe "#full_house?" do
    it "returns true if full house" do
      hand.cards << Card.new('2', "Spades")
      hand.cards << Card.new('2', "Hearts")
      hand.cards << Card.new('3', "Hearts")
      hand.cards << Card.new('3', "Clubs")
      hand.cards << Card.new('3', "Spades")
      expect(hand.full_house?).to be true
    end

    it "returns false if not full house" do
      hand.cards << Card.new('2', "Spades")
      hand.cards << Card.new('9', "Hearts")
      hand.cards << Card.new('3', "Hearts")
      hand.cards << Card.new('3', "Clubs")
      hand.cards << Card.new('3', "Spades")
      expect(hand.full_house?).to be false
    end
  end

  describe "#<=>" do
    let(:pair){ Hand.new }
    let(:two_pair){ Hand.new }
    it "lets two pair beat pair" do
      hand.cards << Card.new('2', "Hearts")
      hand.cards << Card.new('2', "Spades")
      two_pair.cards << Card.new('2', "Hearts")
      two_pair.cards << Card.new('2', "Spades")
      two_pair.cards << Card.new('4', "Hearts")
      two_pair.cards << Card.new('4', "Spades")
      expect(two_pair <=> hand).to eq(1)
    end

  end


  describe "#cards" do
    it "is an array" do
      expect(hand.cards).to be_an(Array)
    end

    # it "should have cards in the array" do
    #   expect(hand.cards.first).to be_a(Card)
    # end
    #
    # it "should have only five cards" do
    #   expect(hand.cards.count).to eq(5)
    # end
  end
end
