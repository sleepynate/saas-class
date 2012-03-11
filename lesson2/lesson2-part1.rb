require "test/unit"

# metaprogramming to the rescue!

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  def in(tag)
    tag_as_string = tag.to_s
    return self / 1.send(tag)
  end
end

class String
  def palindrome?
    test_string = self.downcase.gsub(/\W/, '')
    return test_string == test_string.reverse
  end
end

class TestCurrencyConversion < Test::Unit::TestCase
  def test_currency
    assert_equal(1.dollar, 1)
    assert_equal(10.rupees, 0.19)
    assert_in_delta(52.631578947, 1.dollar.in(:rupees), 0.5)
    assert_equal(1.rupee.in(:dollar), 0.019)
    assert_equal(1.euro.in(:euros), 1)
  end
end

class TestPalindromeStrings < Test::Unit::TestCase
  def test_palindrome
    assert_equal(true, "bob".palindrome?)
    assert_equal(false, "boo".palindrome?)
  end
end
