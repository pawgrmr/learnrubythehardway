class Lexicon
#scan user input and make it into a variable
	def scan(user_input)		
  		@user_input = user_input
  	end

  	def direction
  		@direction = direction
  	end

  #take user_input and sort it into a [type,word] pair
  	
 	def path(user_input)
 		return [direction, user_input]
 	end

end












