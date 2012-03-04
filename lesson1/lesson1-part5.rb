require "test/unit"

=begin

saas-class.org
HW 1: Ruby calisthenics

by Nathan Dotz
sleeptron@gmail.com

=end

###
# Part 5: advanced OOP with some metaprogramming
###

class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s  # make sure it's a string
    attr_reader attr_name  # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}=(v)
        @#{attr_name} = v
        if @#{attr_name}_history.eql? nil
          @#{attr_name}_history = [nil]
        end
        @#{attr_name}_history.push v
      end
    }
  end
end

class Foo
  attr_accessor_with_history :bar
end

class TestFoo < Test::Unit::TestCase

  def test_history
    f = Foo.new
    f.bar = 1
    f.bar = 2
    assert_equal(f.bar_history, [nil,1,2])
    f = Foo.new
    f.bar = 4
    assert_equal(f.bar_history, [nil, 4])
  end
end
