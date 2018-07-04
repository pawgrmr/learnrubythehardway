class Lexicon
#scan user input and make it into a variable
	def scan(answer)		
		# take raw input from user
  		begin
  			#if word is part of lexicon return sentence composed of array of arrays with (token,word pairing)
  			#break up the answer into words
  			answer = $stdin.gets.chomp
  			words = answer.split
  			return direction(word)
  		rescue
  			#if word not part of lexicon - return error token
  			return nil
  		end
  	end



  	def direction
  		@direction = [north, south, east, west, down, up, left, right, back]
  	end

  #take user_input and sort it into a [type,word] pair
  	
 	# def path(user_input)
 	# 	return [direction, user_input]
 	# end

end












