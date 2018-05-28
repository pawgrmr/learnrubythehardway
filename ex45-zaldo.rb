class Room
	def enter()
	end
end

class Hallway
	def initialize(hall_map)
		@hall_map = hall_map
	end

	def play()
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
end

bone_map = BoneMap.new('backyard') #run the game by initializing a map
game = Hallway.new(bone_map) #start the game in the hallway using the map
game.play()




