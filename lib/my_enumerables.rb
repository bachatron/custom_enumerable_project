module Enumerable
  # Your code goes here

  def my_each_with_index
    b = 0  
    for i in self do
      yield(i, b)
      b += 1
    end
    self
  end

  def my_count
    count = 0
    if block_given?
      self.my_each {|i| count += 1 if yield(i)}
      count
    else
      self.length
    end
  end

  def my_any?
    any = false
    self.my_each {|i| any = true if yield(i)} if block_given?
    any
  end

  def my_none?
    any = true
    self.my_each {|i| any = false if yield(i)} if block_given?
    any
  end

  def my_all?
    all = true
    self.my_each {|i| all = false if yield(i)} if block_given?
    all
  end

  def my_select
    selection = []
    self.my_each {|i| selection << i if yield(i)} if block_given?
    selection
  end

  def my_map
    new_array = []
    self.my_each {|i| new_array << (yield(i))} if block_given?
    new_array
  end

  
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array

  def my_each
    for i in self do
      yield(i)
    end
  end

end
