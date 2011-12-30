require_relative '../poker'

describe Poker::Hand do
  def set(*args)
    cards = args.map{ |arg|
      if arg.is_a?(Integer)
        Poker::Card.new(Poker::Card.colors.sample, arg)
      elsif arg.is_a?(Array)
        Poker::Card.new(arg.first, arg.last)
      else
        Poker::Card.new(arg, rand(13))
      end
    }
    Poker::Hand.new(cards)
  end

  context 'straight_flush' do

  end

  context 'straight' do
    context 'normal' do
      subject { set(1, 2, 3, 4, 5) }
      its(:straight?) { should be_true }
    end

    context 'circle' do
      subject { set(12, 13, 1, 2, 3) }
      its(:straight?) { should be_true }
    end

    context 'failure' do
      subject { set( 12, 13, 1, 3, 4) }
      its(:straight?) { should be_false }
    end
  end

  context 'flush' do
    context 'true' do
      subject { set(:heart, :heart, :heart, :heart, :heart) }
      its(:flush?) { should be_true }
    end
    context 'failure' do
      subject { set(:heart, :heart, :heart, :heart, :clover) }
      its(:flush?) { should be_false }
    end
  end

  context '4 cards' do
    context 'true' do
      subject { set(11, 11, 11, 11, 13) }
      its(:four_cards?) { should be_true}
    end
    context 'failure' do
      subject { set(11, 11, 11, 12, 13) }
      its(:four_cards?) { should be_false }
    end
  end

  context '3 cards' do
    context 'failure' do
      subject { set(11, 11, 11, 11, 13) }
      its(:three_cards?) { should be_false}
    end
    context 'true' do
      subject { set(11, 11, 11, 12, 13) }
      its(:three_cards?) { should be_true }
    end

    context 'failure' do
      subject { set(11, 11, 12, 13, 1) }
      its(:three_cards?) { should be_false }
    end
  end

  context 'fullhouse' do
    context 'true' do
      subject { set(11, 11, 13, 13, 13) }
      its(:hullhouse?) { should be_true }
    end
  end

  context 'two_pairs?' do
    context 'true' do
      subject { set(11, 11, 12, 12, 13) }
      its(:two_pairs?) { should be_true }
    end
    context 'failure' do
      subject { set(11, 11, 12, 13, 1) }
      its(:two_pairs?) { should be_false }
    end
  end
end
