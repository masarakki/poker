class Poker::Card
  attr_reader :color, :number
  def initialize(color, number)
    @color = color
    @number = number
  end

  def self.colors
    [:clover, :diamond, :heart, :spade]
  end

  def title
    case @number
    when 13
      'K'
    when 12
      'Q'
    when 11
      'J'
    when 1
      'A'
    else
      @number
    end
  end

  def order
    colors.index(color) * 13 + number
  end

  def to_s
    "#{color.upcase[0]} #{title}"
  end
end
