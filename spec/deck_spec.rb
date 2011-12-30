require_relative '../poker'

describe Poker::Deck do
  subject { Poker::Deck.new }
  it "unique" do
    subject.cards.uniq.size.should == subject.cards.size
  end
end
