class Poker::Hand
  def initialize(cards)
    @cards = cards
  end

  def straight_flush?
    straight? && flush?
  end

  def straight?
    straight_list.include?(@cards.map(&:number).sort)
  end

  def hullhouse?
    number_group.values.sort == [2, 3]
  end

  def four_cards?
    number_group.values.sort == [1, 4]
  end

  def flush?
    color_group.values == [5]
  end

  def three_cards?
    number_group.values.sort == [1, 1, 3]
  end

  def two_pairs?
    number_group.values.sort == [1, 2, 2]
  end

  def one_pair?
    number_group.values.sort == [1, 1, 1, 2]
  end

  def group(key)
    res = {}
    @cards.each do |card|
      val = card.send(key)
      unless res[val]
        res[val] = 1
      else
        res[val] += 1
      end
    end
    res
  end

  def number_group
    @number_group ||= group(:number)
  end

  def color_group
    @color_group ||= group(:color)
  end

  def straight_list
    @straight_list ||= 0.upto(14).map do |n|
      [n, n+1, n+2, n+3, n+4].map{ |x| x%13 + 1}.sort
    end
  end
end
