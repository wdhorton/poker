require 'cards'

describe Card do
  let(:card) { Card.new(2,"Clubs") }

  it "should have a value" do
    expect(card.value).to eq(2)
  end

  it "should have a suit" do
    expect(card.suit).to eq("Clubs")
  end

  it "can have a different suit" do
    card = Card.new(3, "Diamonds")
    expect(card.suit).to eq("Diamonds")
  end

end
