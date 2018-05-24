class Scene
	def enter()
	end
end

class Engine #demonstration of what you would do to make a base class.
	def initialize(scene_map)
		@scene_map = scene_map #variable inside the function (starting with @)
	end

	def play()
		current_scene = @scene_map.opening_scene()  #setting the current scene to an instance of scenemap and run opening scene function?
		last_scene = @scene_map.next_scene('finished') #set the last scene so it runs the finished class when next scene function is triggered.
	
	while current_scene != last_scene
		next_scene_name = current_scene.enter()
		current_scene = @scene_map.next_scene(next_scene_name)
	end

	current_scene.enter()
 end
end

class Death < Scene
 
	@@quips = [ #@@ is a class variable vs @ is a instance variable
		"You died. You kinda suck at this.", 
		"Such a luser.",
		"I have a puppy that's better at this."
	]

	def enter()
		puts @@quips[rand(0..(@@quips.length-1))]
		exit(1)
	end
end


class CentralCorridor < Scene
  	def enter() #has a gothon standing here and needs to be defeated.

  		puts "You entered the central corridor"
  		puts "get the neutron bomb #25 from the weapons armory and put it in the bridge"
  		puts "\n" #add a new line
  		puts "a gothon is blocking your way"
  		print "> "

action = $stdin.gets.chomp

if action == "kick"
	puts "You're dead"
	return 'death' #class death
 elsif action == "punch"
 	puts "You're dead"
 	return 'death'
 elsif action == "tell a joke"
 	return 'laser_weapon_armory' #class laserweaponarmory
 elsif action == "cheat"
 	return 'laser_weapon_armory'
 else 
 	puts "I didn't catch that"
 	return 'central_corridor' #centralcorridor class - i.e. back to the start
 end
 end 	
end

class LaserWeaponArmory < Scene
	def enter() 

	puts "Success! You entered the Laser Weapon Armory."	
	puts "You've found the neutron bomb, you now need to get out"
	puts "you find a keypad lock on the box containing the bomb"
	puts "Enter a 3 digit code to get the bomb, otherwise"
	puts "the lock is permanently damaged"
	code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
	print "[keypad]> "
	guess = $stdin.gets.chomp
	guesses = 0

	while guess != code && guesses < 9
		puts "BZZZZEDDD"
		guesses += 1
		print "[keypad]> "
		guess = $stdin.gets.chomp
	end

	if guess == code
		puts "You cracked the code and got the bomb"
		puts "Get to the bridge asap"
		return 'the_bridge' #class thebridge
	else
		puts "You're dead"
		return 'death'
	end
	end
end

class TheBridge < Scene
	def enter()
		puts "Success! You entered the The Bridge"
		puts "Several gothons are approaching"
		print "> "

		action = $stdin.gets.chomp

		if action == "throw the bomb"
			puts "the bomb goes off"
			return 'death'

		elsif action == "place the bomb and shut the door"
			puts "Run to the Escape Pod"
			return 'escape_pod'
		elsif action == "cheat"
 		return 'escape_pod'
		else
			puts "I didn't catch that"
			return 'the_bridge'
		end
	end
end

class EscapePod < Scene
	def enter()
		puts "There's five pods, which do you take?"

		right_pod = rand(1..5)
		print "[pod #]> "
		guess = $stdin.gets.chomp.to_i

		if guess != good_pod
			puts "you jump into %s and hit eject" % guess
			return 'death'
		elsif action == "cheat"
 		return 'finished'
				
		else
			puts "you jump into %s and hit eject" % guess
			puts "you won"
			return 'finished'
		end
	end
end

class Finished < Scene
	def enter()
		puts "you won!"
	end
end

class Map
	 @@scenes = {
    'central_corridor' => CentralCorridor.new(),
    'laser_weapon_armory' => LaserWeaponArmory.new(),
    'the_bridge' => TheBridge.new(),
    'escape_pod' => EscapePod.new(),
    'death' => Death.new(),
    'finished' => Finished.new()
  }
	def initialize(start_scene)
		@start_scene = start_scene
	end

	def next_scene(scene_name)
		val = @@scenes[scene_name]
		return val
	end

	def opening_scene()
		return next_scene(@start_scene) #takes the start scene ie initialize function as a parameter?
	end
end

a_map = Map.new('central_corridor') #run the game by making a map
a_game = Engine.new(a_map) # hand the map to the engine
a_game.play() #call play to make the game work
next_game = Map.new('laser_weapon_armory')
next_game = Engine.new(next_game)
next_game.play()



