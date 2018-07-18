class Lexicon
#split sentence/user input into words
#take each of the words and #if word matches the value in the direction hash, 
# wrong : return it as an array of array with (word, [[direction, word]]) pairing.
#right: return an array of [value, word]
#right: push this array to the empty mega array of arrays.
#make sure to return result

	 	@@hash = {
	 		'direction' => ['south', 'north', 'east']
		}


	def self.scan(sentence)
		words = sentence.split(' ')
		result = []

		words.each do |word|
			@@hash.each do |key, value|
					if value.include?(word)
					element = [key, word]
					result.push(element)
				end
				return result
			end
		end
	end
end




 # def test_directions()
 #    assert_equal(Lexicon.scan("north"), [['direction', 'north']])
 #    result = Lexicon.scan("north south east")

 #    assert_equal(result, [['direction', 'north'],
 #           ['direction', 'south'],
 #           ['direction', 'east']])
 #  end

