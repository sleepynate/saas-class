require "test/unit"

=begin

saas-class.org
HW 1: Ruby calisthenics

by Nathan Dotz
sleeptron@gmail.com

=end

###
# Part 3: anagrams
###

def combine_anagrams(words)

end

class TestAnagrams < Test::Unit::TestCase
  def test_combine_anagrams
    input = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar','creams','scream']
    output = [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]
    assert_equal(output, combine_anagrams(input))
  end
end
