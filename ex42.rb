## Animal is-a object look at the extra credit
class Animal
  def move
    puts "walk"
  end
end

## ?? dog is-a class 
class Dog < Animal

  def initialize(name)
    ## ?? dog has-a name object
    @name = name
  end

  def sound
    puts "woof"
  end
end
puts Animal.new.move

## ?? cat is-a class
class Cat < Animal

  def initialize(name)
    ## ?? cat has-a name
    @name = name
  end

  def sound 
    puts "meow"
  end
end

## ?? Person is-a object
class Person 

  def initialize(name)
    ## ?? person has-a name object
    @name = name

    ## Person has-a pet of some kind
    @pet = nil
  end  

  attr_accessor :pet

end

## ?? Employee is-a Person
class Employee < Person

  def initialize(name, salary)
    ## ?? hmm what is this strange magic? employee has-a name and has-a salary
    super(name) #calls Person#intialize
    ## ?? Person has-a name
    @salary = salary
  end

end

## ?? Fish is-a object
class Fish
  def sound
    puts "swishy swish"
  end 
end

## ?? Salmon is-a Fish and a class 
class Salmon < Fish
end

## ?? Halibut is-a Fish and a class 
class Halibut < Fish
end


## rover is-a Dog 
rover = Dog.new("Rover")
rover.sound
## ?? Satan is-a Cat
satan = Cat.new("Satan")
satan.sound
## ?? Mary is-a Person
mary = Person.new("Mary")

## ?? Mary has-a pet Satan, Satan is-a cat
mary.pet = satan

## ?? frank is-a employee. Employee has-a name frank and salary 120K
frank = Employee.new("Frank", 120000)

# sadie = Person.greet("hello")

## ?? frank has-a pet rover
frank.pet = rover 

## ?? flipper is-a class? instance of Fish class
flipper = Fish.new()

## ?? crouse is-a (object) instance of Salmon class
crouse = Salmon.new()

## ?? harry is-a (object) instance of Halibut class
harry = Halibut.new()
