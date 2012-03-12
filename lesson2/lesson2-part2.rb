require "test/unit"

class CartesianProduct
  include Enumerable
  def initialize (a, b)
    @member_a = a
    @member_b = b
  end

  def each
    @member_a.each do |a|
      @member_b.each do |b|
        yield [a,b]
      end
    end
    nil
  end
end

class TestCartesian < Test::Unit::TestCase
  def test_two
    c = CartesianProduct.new([:a,:b], [4,5])
    assert_equal(c.sort, [[:a, 4], [:a, 5], [:b, 4], [:b, 5]])
  end
  def test_none
    c = CartesianProduct.new([:a,:b], [])
    assert_equal(c.sort, [])
  end
end
