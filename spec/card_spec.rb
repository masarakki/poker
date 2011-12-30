require_relative '../poker'

describe Poker::Card do
  context "Spade 13" do
    subject { Poker::Card.new(:spade, 13) }
    its(:number) { should == 13 }
    its(:to_s) { should == "S K" }
    its(:title) { should == "K" }
    its(:color) { should == :spade }
    its(:order) { should == 52 }
  end

  context "Heart 12" do
    subject { Poker::Card.new(:heart, 12) }
    its(:number) { should == 12 }
    its(:to_s) { should == "H Q" }
    its(:title) { should == "Q" }
    its(:color) { should == :heart }
    its(:order) { should == 38 }
  end

  context "Diamond 11" do
    subject { Poker::Card.new(:diamond, 11) }
    its(:number) { should == 11 }
    its(:to_s) { should == "D J" }
    its(:title) { should == "J" }
    its(:color) { should == :diamond }
    its(:order) { should == 24 }
  end

  context "Clover 1" do
    subject { Poker::Card.new(:clover, 1) }
    its(:number) { should == 1 }
    its(:to_s) { should == "C A" }
    its(:title) { should == "A" }
    its(:color) { should == :clover }
    its(:order) { should == 1 }
  end
end
