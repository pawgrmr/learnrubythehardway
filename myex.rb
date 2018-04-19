puts "You enter a zoo with two counters. Do you go to counter #1 or counter #2?"

print "> "
counter = $stdin.gets.chomp

if counter == "1"
	puts "You can choose one of two options. Which do you choose"
	puts "1. Go see the monkeys and gorillas"
	puts "2. Go see the lions and tigers"

	print "> "
	option = $stdin.gets.chomp

	if option == "1"
		puts "you get to see the monkeys and gorillas"
	elsif option == "2"
		puts "you get to see the lions and tigers"
	else 
		puts "you get to go home"
	end

elsif counter == "2"
	puts "You can choose one of the following answer"
	puts "1. Go see the dolphins"
	puts "2. Go see the reptiles"

	print "> "
	answer = $stdin.gets.chomp

	if answer == "1"
		puts "you're swimming with the dolphins"
	elsif answer == "2"
		puts "you're swimming with the reptiles"
	else 
		puts "you're going home"
	end

else 
	puts "exit the building if you don't want to choose"
			
end