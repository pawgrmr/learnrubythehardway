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
	 		'number' => ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
		}

	def self.scan(sentence)
		words = sentence.split(' ')
		result = [] # this array should contain arrays of [key word]

		words.each do |word|
			element = [] # push this array of [key,word] to the result array
				@@hash.each do |key, value|
					if value.include?(word)
					element = [key, word]
					result.push(element) 
					end
				end
		end
				return result
	end
		
end


  # def test_numbers()
  #   assert_equal(Lexicon.scan("1234"), [['number', 1234]])
  #   result = Lexicon.scan("3 91234")
  #   assert_equal(result, [['number', 3],
  #          ['number', 91234]])
  # end
