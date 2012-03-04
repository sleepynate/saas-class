require "test/unit"

=begin

saas-class.org
HW 1: Ruby calisthenics

by Nathan Dotz
sleeptron@gmail.com

=end

###
# Part 4: Basic OOP
###

class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def calories
    @calories
  end
  def calories=(calories)
    @calories = calories
  end
  def healthy?
    @calories < 200
  end
  def delicious?
    true
  end
end
class JellyBean < Dessert
  def initialize(name, calories, flavor)
    @flavor = flavor
    @name = name
    @calories = calories
  end
  def delicious?
    false ? @flavor.eql? 'black licorice' : true
  end
end
