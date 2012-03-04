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

class String
  def sort
    self.split(//).sort.join
  end
end

def combine_anagrams(words)
  words.collect do |word|
    words.select do |maybe_word|
      maybe_word.downcase.sort.eql? word.downcase.sort
    end
  end.uniq
end

class TestAnagrams < Test::Unit::TestCase
  def test_combine_anagrams
    input = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar','creams','scream']
    output = [["cars", "racs", "scar"], ["for"], ["potatoes"], ["four"], ["creams", "scream"]]
    assert_equal(output, combine_anagrams(input))
  end
end
