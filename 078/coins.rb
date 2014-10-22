# Let p(n) represent the number of different ways in which n coins can
# be separated into piles. For example, five coins can separated into
# piles in exactly seven different ways, so p(5)=7.

# OOOOO
# OOOO   O
# OOO   OO
# OOO   O   O
# OO   OO   O
# OO   O   O   O
# O   O   O   O   O
# Find the least value of n for which p(n) is divisible by one million.

class HashHash < Hash
  def initialize
    super { |h,k| h[k] = HashHash.new }
  end
end

$coin_piles = {0 => 1, 1 => 1}

# How many different coin piles can be made with n coins
def coin_piles(total)
end


def coin_piles_helper(total, groups)
  return 1 if groups == 1
  return 1 if total == groups


end


require 'minitest/autorun'

class TestCoinPiles < Minitest::Test
  def test_coin_piles_one
    assert_equal 1, coin_piles(1)
  end

  def test_coin_piles_two
    assert_equal 2, coin_piles(2)
  end

  def test_coin_piles_three
    assert_equal 3, coin_piles(3)
  end

  def test_coin_piles_four
    assert_equal 5, coin_piles(4)
  end
end
