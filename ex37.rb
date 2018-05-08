

#http://ruby-doc.org/docs/keywords/1.9/Object.html
#example of alias

class User

  def full_name
    puts "Johnnie Walker"
  end

  alias name full_name
end

User.new.name

#example of break: Terminates the most internal loop. Terminates a method with an associated block if called within the block (with the method returning nil).
while true; break; end
for i in 0..5
   if i > 2 then
      break
   end
   puts "Value of local variable is #{i}"
end

#example of case:
x=11
case x
when 1,2,3
  puts "1, 2, or 3"
when 10
  puts "10"
else
  puts "Some other number"
end

# example of ensure:Marks the final, optional clause of a begin/end block, generally in cases where the block also contains a rescue clause. The code in the ensure clause is guaranteed to be executed, whether control flows to the rescue block or not.
begin
  1/0 #If the statement 1/0 is changed to something harmless, like 1/1, the rescue clause will not be executed but the ensure clause still will.
rescue ZeroDivisionError
  puts "Can't do that!"
ensure
  puts "That was fun!"
end

# example for next #Bumps an iterator, or a while or until block,to the next iteration, unconditionally and without executing whatever may remain of the block.
sizes = [0,1,2,3,4].map do |n|
  next("big") if n > 2
  puts "Small number detected!"
  "small"
end

# example of redo: Causes unconditional re-execution of a code block, with the same parameter bindings as the current execution.

(0..5).each {|i| redo if i > 2}

example for rescue: Run this code if an exception happens.
begin
  1/0
rescue ZeroDivisionError
  puts "No way"
end

# example for retry
a = 0
begin
  1/a
rescue ZeroDivisionError => e
  puts e.message
  puts "Let's try that again..." #prints error because 1/0 
  a = 1
  retry #runs through code again with 1/1 and this does not result in an error so prints out "that's better"
end
puts "That's better!"

# example for self: The current object, class, or module.
class String
  def upcase_and_reverse
    upcase.reverse
  end
end
In this method definition, the message upcase goes to self, which is whatever string calls the method.


# example for super
module Vehicular
#Called from a method, searches along the method lookup path (the classes and modules available to the current object) for the next method of the same name as the one being executed. Such method, if present, may be defined in the superclass of the object’s class, but may also be defined in the superclass’s superclass or any class on the upward path, as well as any module mixed in to any of those classes.
  def move_forward(n)
    @position += n
  end
end

class Vehicle
  include Vehicular  # Adds Vehicular to the lookup path
end

class Car < Vehicle
  def move_forward(n)
    puts "Vrooom!"
    super            # Calls Vehicular#move_forward
  end
end


# example for then
#optional component of if/else, unless and when conditional statements.
if a > b; puts "a wins!" end
if a > b then puts "a wins!" end



# example for undef Undefines a given method, for the class or module in which it’s called. If the method is defined higher up in the lookup path (such as by a superclass), it can still be called by instances classes higher up.
class C
  def m
    "Hi"
  end
end
class D < C
end
class E < D
end

class D
  undef m
end
#Output on terminal:
C.new.m   # Hi
D.new.m   # error
E.new.m   # error


# Example for unless: inverse of if
unless y.score > 10
  puts "Sorry; you needed 10 points to win."
end


















