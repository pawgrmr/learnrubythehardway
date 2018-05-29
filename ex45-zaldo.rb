class Room
	def enter()
	end
end

class Hallway
	def initialize(hall_map)
		@hall_map = hall_map
	end

	def play()
		current_room = @hall_map.opening_room()
		last_room = @hall_map.end_room()
	#while current room != last_room
	while current_room != last_room
		next_room_name = current_room.enter()#set the next room to current room 
		current_room = @hall_map.next_room_name#once finished with the task in the current room run code for the next room
	end
		current_room.enter()
	end
end

class Backyard < Room
	def enter()
	end
end

class Livingroom < Room
	def enter()
	end
end

class Laundry < Room
	def enter()
	end
end

class Bedroom < Room
	def enter()
	end
end

class Garage < Room
	def enter()
	end
end

class Retreat
	def enter()
	end
end

class BoneMap
	def initialize(start_room)
		@start_room = start_room
	end

	def next_room(room_name)
	end

	def opening_room()
	end

	def end_room()
		puts "Zaldo has now completed his bonehunt!"
	end
end

bone_map = BoneMap.new('backyard') #run the game by initializing a map
game = Hallway.new(bone_map) #start the game in the hallway using the map
game.play()




