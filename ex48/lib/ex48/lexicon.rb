class Lexicon
#split sentence/user input into words
#take each of the words and #if word matches the value in the direction hash, 
# wrong : return it as an array of array with (word, [[direction, word]]) pairing.
#right: return an array of [value, word]
#right: push this array to the empty mega array of arrays.
#make sure to return result

	 	@@hash = {
	 		'direction' => ['south', 'north', 'east'],
	 		'verb' => ['go', 'kill', 'eat'],
	 		'stop' => ['the', 'in', 'of'],
	 		'noun' => ['bear', 'princess'], 
		}

	

	def self.scan(sentence)
		words = sentence.split(' ')
		result = [] # this array should contain arrays of [key word]
		words.each do |word|
			element = [] 

				number = Lexicon.convert_integer(word)
					if number #is true then return the following
						element = ['number', number]
						result.push(element) 
					# elsif 
					# 	number.exclude?(word)
					# 	element = ['error', word]
					# 	result.push(element)
					end
			# push this array of [key,word] to the result array
				@@hash.each do |key, value|
					if value.include?(word)
						element = [key, word]
						result.push(element) 

					# elsif value.exclude?(word) 
					# 	element = ['error', word]
					# 	result.push(element)
						
					end
				end

					if element.!include?(@@hash.values)
						element = ['error', word]
						result.push(element)
					end
				 	# while element.empty?
				  #       element = ['error', word]
				  #       result.push(element)
				  #       break
				  #   end
		end
				return result
	end

	def self.convert_integer(word) #scan self and convert to integer - this becomes the number variable
  		begin
    		return Integer(word)
  		rescue
    		return 'error'
  		end
	end

end
