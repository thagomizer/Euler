# In the card game poker, a hand consists of five cards and are ranked, from
# lowest to highest, in the following way:

##     * Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
##     * Straight Flush: All cards are consecutive values of same suit.
##     * Four of a Kind: Four cards of the same value.
##     * Full House: Three of a kind and a pair.
##     * Flush: All cards of the same suit.
##     * Straight: All cards are consecutive values.
##     * Three of a Kind: Three cards of the same value.
##     * Two Pairs: Two different pairs.
##     * One Pair: Two cards of the same value.
##     * High Card: Highest value card.

#
# The cards are valued in the order:
# 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.
#
# If two players have the same ranked hands then the rank made up of the highest
# value wins; for example, a pair of eights beats a pair of fives (see example
# 1 below). But if two ranks tie, for example, both players have a pair of
# queens, then highest cards in each hand are compared (see example 4 below);
# if the highest cards tie then the next highest cards are compared, and so on.

# Consider the following five hands dealt to two players:

# Hand          Player 1                Player 2                Winner
# 1             5H 5C 6S 7S KD          2C 3S 8S 8D TD          Player 2
#               Pair of Fives           Pair of Eights
#
# 2             5D 8C 9S JS AC          2C 5C 7D 8S QH          Player 1
#               Highest card Ace        Highest card Queen
#
# 3             2D 9C AS AH AC          3D 6D 7D TD QD          Player 2
#               Three Aces              Flush with Diamonds
#
# 4             4D 6S 9H QH QC          3D 6D 7H QD QS          Player 1
#               Pair of Queens          Pair of Queens
#               Highest card Nine       Highest card Seven
#
# 5             2H 2D 4C 4D 4S          3C 3D 3S 9S 9D          Player 1
#               Full House              Full House
#               With Three Fours        with Three Threes
#
# The file, poker.txt, contains one-thousand random hands dealt to two players.
# Each line of the file contains ten cards (separated by a single space): the
# first five are Player 1's cards and the last five are Player 2's cards. You
# can assume that all hands are valid (no invalid characters or repeated cards),
# each player's hand is in no specific order, and in each hand there is a clear
# winner.

# How many hands does Player 1 win?
require 'pp'

class PokerHand
  def initialize(hand)
    @suits = hand.map{|card| card.split(//)[1]}
    @ranks = hand.map{|card| card.split(//)[0]}
    @ranks.each_with_index do |rank, index|
      case rank
      when "T"
        @ranks[index] = 10
      when "J"
        @ranks[index] = 11
      when "Q"
        @ranks[index] = 12
      when "K"
        @ranks[index] = 13
      when "A"
        @ranks[index] = 14
      else
        @ranks[index] = rank.to_i
      end
    end
    @ranks.sort!
    @ranks.reverse!
    @num_cards = @ranks.length
  end

  def high_card
    @ranks[0]
  end

  def pair
    @ranks.each do |r|
      if @ranks.select{|x| x == r}.length == 2 then
        return r
      end
    end
    return nil
  end

  def two_pair
    pairs = []
    @ranks.each do |r|
      if @ranks.select{|x| x == r}.length == 2 then
        pairs << r
      end
    end
    if pairs.length == 4 then
      return pairs.max
    end
    return nil
  end

  def three_of_a_kind
    @ranks.each do |r|
      if @ranks.select{|x| x == r}.length == 3 then
        return r
      end
    end
    return
  end

  def straight?
    return unless @num_cards == 5
    @ranks.each_cons(2) do |a, b|
      return nil if a - b != 1
    end
    @ranks[0]
  end

  def flush?
    if @suits.uniq.length == 1 && @num_cards == 5 then
      return @ranks[0]
    end
    return nil
  end

  def full_house
    return nil if @num_cards != 5
    three = three_of_a_kind
    rest = @ranks.reject{|x| x == three}
    return three if rest[0] == rest[1]
    return nil
  end

  def four_of_a_kind
    @ranks.each do |r|
      if @ranks.select{|x| x == r}.length == 4 then
        return r
      end
    end
    return nil
  end

  def straight_flush?
    straight? and flush?
  end

  def royal_flush?
    straight_flush? and @ranks[0] == 10
  end

  def score
    if royal_flush?
      return [9, nil]
    elsif straight_flush?
      return [8, @ranks[0]]
    elsif four_of_a_kind
      x = four_of_a_kind
      return [7, x]
    elsif full_house
      x = full_house
      return [6, x]
    elsif flush?
      return [5, @ranks[0]]
    elsif straight?
      return [4, @ranks[0]]
    elsif three_of_a_kind
      x = three_of_a_kind
      return [3, x]
    elsif two_pair
      x = two_pair
      return [2, x]
    elsif pair
      x = pair
      rest = @ranks.reject{|r| r == x}
      return [1, x, rest]
    else
      return [0, @ranks[0]]
    end
  end

  def to_s
    "Ranks #{@ranks.join(',')} Suits #{@suits.join(',')}"
  end
end

def return_to_normal_ranks(rank)
  case rank
  when 10
    "T"
  when 11
    "J"
  when 12
    "Q"
  when 13
    "K"
  when 14
    "A"
  else
    rank
  end
end

def compare(hand1, hand2)
  score1 = hand1.score
  score2 = hand2.score
  if score1[0] == score2[0] then
    if score1[1] > score2[1] then
      return 1
    elsif score1[1] < score2[1] then
      return 2
    else
      h1 = PokerHand.new(score1[2].map{|x| "#{return_to_normal_ranks(x)}H"})
      h2 = PokerHand.new(score2[2].map{|x| "#{return_to_normal_ranks(x)}H"})
      return compare(h1, h2)
    end
  elsif score1[0] > score2[0] then
    return 1
  elsif score1[0] < score2[0] then
    return 2
  end
end


player1 = 0
player2 = 0
total = 0

f = File.open('poker.txt', "r")
f.each_line do |line|
  total += 1
  cards = line.split(' ')
  hand1 = PokerHand.new(cards[0..4])
  hand2 = PokerHand.new(cards[5..10])
  result = compare hand1, hand2
  if result == 1 then
    player1 += 1
  elsif result == 2 then
    player2 += 1
  end
end

pp "Player 1 #{player1}"
pp "Player 2 #{player2}"
pp "Total #{total}"
pp "Check #{player1 + player2}"

# time ruby poker.rb
# "Player 1 376"
# "Player 2 624"
# "Total 1000"
# "Check 1000"

# real	0m0.371s
# user	0m0.344s
# sys	0m0.005s
