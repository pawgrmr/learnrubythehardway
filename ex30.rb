people = 10
cars = 40
trucks = 100
# if cars greater than people
if cars > people 
	# print the following
	puts "We should take the cars"
	# if cars are less than people
elsif cars < people
	# print the following
	puts "we should not take the cars"
else 
	# if neither of those are true then print the following
	puts "we can't decide"
end

if trucks > cars 
	puts "thats too many trucks"
elsif trucks < cars
	puts "maybe we could take the trucks"
else
	puts "we still cant decide"
end
# if theres more people than trucks
if people > trucks
	# print this
	puts "Alright, lets just take the trucks"
else 
	# otherwise print this
	puts "Fine, lets stay home then"
end
		
		