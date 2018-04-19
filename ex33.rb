# i = 0
# numbers = []

# while i < 6 
# 	puts "At the top i is #{i}"
# 	numbers.push(i)

# 	i += 1
# 	puts "Numbers now: ", numbers
# 	puts "At the bottom i is #{i}"
# end

# puts "The numbers: "

# numbers.each {|num| puts num }

############################################################
#study drill 1 and 2

# def count(num_end)
# 	i = 0
# 	numbers = []

# 	while i < num_end 
# 	puts "At the top is i #{i}"
# 	numbers.push(i)
# 	i += 1 
# 	puts "Numbers now: ", numbers
# 	puts "At the bottom is #{i}"
# 	end
# 	numbers.each {|num| puts num}
# end

# count(6)

#thought process:
	#function needs a start variable
	#function needs a end variable (to represent 6)
	#function needs to add 1 to the start variable and print it
	#function needs to stop when it reaches end variable

############################################################
#study drill 3 and 4
# def count(num_end, increment)
# 	i = 0
# 	numbers = []

# 	while i < num_end 
# 	puts "At the top is i #{i}"
# 	numbers.push(i)
# 	i += increment 
# 	puts "Numbers now: ", numbers
# 	puts "At the bottom is #{i}"
# 	end
# 	numbers.each {|num| puts num}
# end

# count(10, 4)


############################################################
#study drill 5
def count(num_start, num_end)
	numbers = []
	(num_start..num_end).each do |i|
	puts "at the top is #{i}"
	numbers.push(i)
	
	puts "Numbers now: ", numbers
	puts "At the bottom is #{i}"
	end 
puts "The numbers"
numbers.each {|num| puts num}
end

count(0, 2)




