
class Poker::Deck
  def initialize
    @cards = [:spade, :heart, :diamond, :clover].map {|color|
      1.upto(13).map { |num|
        Card.new(color, num)
      }
    }.flatten(1).sort_by{ rand }
  end

  def cards
    @cards
  end
end
