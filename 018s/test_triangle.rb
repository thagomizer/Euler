require 'test/unit'
require 'triangle'

class TestTriangle < Test::Unit::TestCase
  def test_create_triangle
    assert_not_nil Triangle.new("small_triangle.txt")
  end

  def test_small_max
    t = Triangle.new("small_triangle.txt")
    assert_equal 23, t.find_max
  end

  def test_medium_tree
    t = Triangle.new("medium_triangle.txt")
    assert_equal 1074, t.find_max
  end

  def test_big_tree
    t = Triangle.new("big_triangle.txt")
    assert_equal 7273, t.find_max
  end
end

# ....
# Finished in 0.043914 seconds.

# 4 tests, 4 assertions, 0 failures, 0 errors

# real	0m0.081s
# user	0m0.067s
# sys	0m0.012s
