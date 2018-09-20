module Map
class Room

	def initialize(name, description)
		@name = name
		@description = description
		@paths = {}
	end

#make it easy to access the variables above
	attr_reader :name
	attr_reader :paths
	attr_reader :description

	def go(direction)
		return @paths[direction]
	end

	def add_paths(paths)
		@paths.update(paths)
	end

end

#connect these rooms to create the map using Room.add_paths
CENTRAL_CORRIDOR = Room.new("Central Corridor",
	"""description""")

LASER_WEAPON_ARMORY = Room.new("Laser Weapon Armory",
"""description""")

THE_BRIDGE = Room.new("The Bridge", 
"""description""")

ESCAPE_POD = Room.new("Escape Pod",
"""description""")

THE_END_WINNER = Room.new("The End", 
"""description""")

THE_END_LOSER = Room.new("The End",
"""description""")


ESCAPE_POD.add_paths({
	'2' => THE_END_LOSER,
	'*' => THE_END_WINNER
})

GENERIC_DEATH = Room.new("death", "You died.")

THE_BRIDGE.add_paths({
	'throw the bomb' => GENERIC_DEATH,
	'slowly place the bomb' => ESCAPE_POD
})

LASER_WEAPON_ARMORY.add_paths({
	'0132' => THE_BRIDGE,
	'*' => GENERIC_DEATH
})

CENTRAL_CORRIDOR.add_paths({
 	'shoot!' => GENERIC_DEATH, 
 	'dodge!' => GENERIC_DEATH,
	'tell a joke' => LASER_WEAPON_ARMORY
})


START = CENTRAL_CORRIDOR

#Find rooms by their names, load them and save them to a 'session'

	ROOM_NAMES = {
		'CENTRAL_CORRIDOR' => CENTRAL_CORRIDOR,
		'LASER_WEAPON_ARMORY' => LASER_WEAPON_ARMORY,
		'THE_BRIDGE' => THE_BRIDGE,
		'ESCAPE_POD' =>	ESCAPE_POD,
		'THE_END_WINNER' => THE_END_WINNER,
		'THE_END_LOSER' => THE_END_LOSER,
		'START' => START,
	}

	def Map::load_room(session)
		#Given a session this will return the right room or nil
		return ROOM_NAMES[session[:room]]
	end

	def Map::save_room(session, room)
		session[:room] = ROOM_NAMES.key(room)
	end

end































