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