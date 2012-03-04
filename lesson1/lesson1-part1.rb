require "test/unit"

=begin

saas-class.org
HW 1: Ruby calisthenics

by Nathan Dotz
sleeptron@gmail.com

=end

###
# Part 1: fun with strings
###

def palindrome? ( something )
  raise unless something.is_a?(String)
  test_string = something.downcase.gsub(/\W/, '')
  return test_string == test_string.reverse
end

def count_words ( something )
  test_list = something.downcase.gsub(/\W+/,' ').split(/\b/)
  success_hash = {}
  test_list.uniq.each { |x| success_hash[x] = test_list.count(x)}
  success_hash.delete(" ")
  success_hash
end

class TestStrings < Test::Unit::TestCase

  def test_palindrome
    assert_equal(true, palindrome?("A man, a plan, a canal -- Panama"))
    assert_equal(true, palindrome?("Madam, I'm Adam!"))
    assert_equal(false, palindrome?("Abracadabra"))
  end

  def test_count_words
    panama_answer = {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
    doo_bee_answer = {'doo' => 3, 'bee' => 2}
    assert_equal(panama_answer, count_words("A man, a plan, a canal -- Panama"))
    assert_equal(doo_bee_answer, count_words("Doo bee doo bee doo"))
  end
end
