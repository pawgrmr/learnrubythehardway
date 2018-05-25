#All three examples of inheritance interacting in the one file.
class Parent

  def override()
    puts "PARENT override()"
  end

  def implicit()
    puts "PARENT implicit()"
  end

  def altered()
    puts "PARENT altered()"
  end
end

class Child < Parent

  def override()
    puts "CHILD override()"
  end

  def altered()
    puts "CHILD, BEFORE PARENT altered()"
    super()
    puts "CHILD, AFTER PARENT altered()"
  end
end

dad = Parent.new() #dad is an instance of parent 
son = Child.new() #son is an instance of child

dad.implicit() #returns "PARENT implicit()"
son.implicit() #returns "PARENT implicit()"

dad.override() #returns "PARENT override()"
son.override() #returns "CHILD override()"

dad.altered() #returns "PARENT altered()"
son.altered() #returns:
# "CHILD, BEFORE PARENT altered()"
# "PARENT altered()"
# "CHILD, AFTER PARENT altered()"