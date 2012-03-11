require "test/unit"

# metaprogramming to the rescue!

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
end

class String
  def palindrome?
    test_string = self.downcase.gsub(/\W/, '')
    return test_string == test_string.reverse
  end
end

class TestPalindromeStrings < Test::Unit::TestCase
  def test_palindrome
    assert_equal(true, "bob".palindrome?)
    assert_equal(true, "boo".palindrome?)
  end
end
