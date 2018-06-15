class Room 
	def enter()
	end 
end

class Hallway		 

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
	def enter() 
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
	
	def enter()
		options = ["rug", "arm chair", "bed"]
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

	@@rooms = { 
		'backyard' => Backyard.new(), 
		'livingroom' => Livingroom.new(),
		'laundry' => Laundry.new(),
		'bedroom' => Bedroom.new(),
		'retreat' => Retreat.new(),
		'finished' => Finished.new()
	}

	def initialize(start_room) 
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

bone_map = BoneMap.new('backyard') 
a_game = Hallway.new(bone_map) 
a_game.play() 



