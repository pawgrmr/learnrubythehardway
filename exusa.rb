def start 
	puts "You are at a travel agent"
	puts "You decide to travel to America"
	puts "You have to choose from three cities. Which do you choose?"

	print "> "
	answer = $stdin.gets.chomp

	if answer == "New York"
		new_york #write a fn for this
	elsif answer == "New Orleans"
		new_orleans #write a fn for this
	else answer == "Washington"
		washington_dc #write a fn for this
	end
end

def go_home(why)
	puts why, "Oh dear..go home :("
	exit(0)
end

def washington_dc
	puts "Great choice! Washington DC!"
	puts "Where would you like to go?"
	trump_is_president = true

	while true
	print "> "
	answer = $stdin.gets.chomp

		if answer == "White House" && trump_is_president 
			puts go_home("Trump is still president.")
		elsif answer == "Capitol Hill" && !trump_is_president
			trump_is_president = false
			puts "Great choice! Trump is no longer the president!"
		else 
			puts "Get a coffee then decide!"
			washington_dc
		end
	end
end

def raining
	puts "it's raining! Grab your brolly!"
	exit(0)
end

#write fn for new york
	#if/else statement with some booleans
def new_york
	puts "Ok, where in NYC would you like to go?"

	print "> "
	answer = $stdin.gets.chomp
	its_raining = true

		if answer == "Empire State Building" && !its_raining
			puts great_choice("Make sure you grab a jacket!")
		elsif answer == "Times Square" && its_raining
			raining
		else 
			go_home
		end
	
end

def new_orleans
	puts "Jazz and Voodoo eh? Nola it is! Here are your options"

	options = ['ghost tour', 'vampire tour', 'plantation tour', 'bourboun street', 'markets']

	options.each do |option|
		puts "#{option}"
	end

	print "> "
	answer = $stdin.gets.chomp

	if answer.include?("vampire") || ("ghost")
		puts "Spooky!"
	elsif 
		answer.include?("plantation")
		puts "A dose of history - interesting!"
	else 
		puts "Have a nice walk!"
	end
end


				


#write fn for new orleans
	#try writing an array here with a for loop (..).each do | |
	#booleans and escape sequences
start