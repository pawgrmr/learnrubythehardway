class Room #This Scene class is a template for all of the other scenes that are more interesting. The intention is not to use Scene class directly but only the subclasses 
	def enter()
	end 
end

class Hallway	# this is going to be the main entry point of the game	because of the play method.	 

	def initialize(room_map) 
		@room_map = room_map 
	end

	def play() 
		current_room = @room_map.opening_room()
		last_room = @room_map.next_room('finished')
		
	while current_room != last_room
		next_room_name = current_room.enter()
		current_room = @room_map.next_room(next_room_name)
	end
	current_room.enter()
	end
end 


class Retreat < Room 
	def enter() #overrides the parent Room class method enter
		puts "Zaldo retreated from the bonehunt!"
		exit(1)
	end
end



class Backyard < Room
	def enter()
		puts "Zaldo is in the backyard."
		puts "Zaldo needs to find the bone which may or may not be hidden here,"
		puts "whilst watching for the magpies."
		puts "What should Zaldo do?"
		print "> "

		action = $stdin.gets.chomp

		if action == "dig"
			return 'livingroom'
		else
			puts "Oh no! Zaldo is too busy chasing off magpies"
			return 'retreat'
		end
	end
end

class Livingroom < Room
	@@options = [
		'1. Jump onto the couch and onto the rug to avoid the slippery floor',
		'2. There\'s cake on the floor, eat it!',
		'3. The couch is comfy, have a nap!'
	]


	def enter()
		puts "Zaldo has now entered the Livingroom."
		puts "To continue on the bone hunt pick one of the following options"
		puts @@options
		print "> "

	answer = $stdin.gets.chomp
	if answer.include?('1')
		return 'laundry'
	else 
		puts "Oh no! Zaldo got distracted"
		return 'retreat'	
	end
end
end

class Laundry < Room
	def enter()
		puts "Zaldo has now entered the Laundry"
		puts "Zaldo has to sniff around the washing machine and rummage through piles of clothing"
		print "> "

	action = $stdin.gets.chomp

	if action == "sniff"
		puts "Oh no! Zaldo has sniffed too much laundry powder and is now on a sneezing fit"
		return 'retreat'
	else action == "rummage"
		puts "Great! Now Zaldo can move onto the Bedroom"
		return 'bedroom'
	end
end
end

class Bedroom < Room
	options = ["rug", "arm chair", "bed"]
	def enter()
		puts "Zaldo has now reached his final destination - the bedroom!"
		puts "If he finds the bone, he gets to jump on the bed and eat it"
		puts "Choose where Zaldo should begin:"
		puts "#{options}"
		print "> "

	action = $stdin.gets.chomp

	if action == "bed"
		puts "Yay! Zaldo has found the bone!"
		return 'finished'
	else 
		return 'retreat'
	end
end
end

class Finished < Room
	def enter()
		puts "you won!"
	end
end

class BoneMap

	@@rooms = { # hash contains the room objects 
		'backyard' => Backyard.new(), # these are the room_names matching with room objects.
		'livingroom' => Livingroom.new(),
		'laundry' => Laundry.new(),
		'bedroom' => Bedroom.new(),
		'retreat' => Retreat.new(),
		'finished' => Finished.new()
	}

	def initialize(start_room) #corresponds with bone_map = BoneMap.new('backyard').This method sets the variable @start_room to the value of start_room, which is the parameter, so it is whatever you passed in.
		@start_room = start_room
	end

	def next_room(room_name)
		value = @@rooms[room_name]
		return value
	end

	def opening_room()
		return next_room(@start_room)
	end
end

bone_map = BoneMap.new('backyard') # Line 1 set bone_map to an instance of the class Bonemap. Creates a new map with backyard passed to the start_room initialise function. Creates a new map object
a_game = Hallway.new(bone_map) 
#Line 2 passes this newly created Map object to the Hallway initialize function (@room_map).This simply sets the variable @room_map to the value you passed in. So now Hallway has access to bone_map object
#Line 2 set game to an instance of the class Hallway taking bone_map as a parameter (i.e. in this case backyard)
a_game.play() # Line 3 run the code starting with backyard until the current_room != last_room.  the third line calls the play() method of the Hallway object
next_room = BoneMap.new('livingroom')
next_room = Hallway.new(next_room)
next_room.play()




