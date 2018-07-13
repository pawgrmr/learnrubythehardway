class Lexicon
#split sentence/user input into words
#take each of the words and #if word matches the value in the direction hash, 
# wrong : return it as an array of array with (word, [[direction, word]]) pairing.
#right: return an array of [value, word]
#right: push this array to the empty mega array of arrays.
#make sure to return result

	 	@@hash = {
			'north' => 'direction'
		}

	def self.scan(sentence)
		words = sentence.split
		result = []

		words.each do |word|
			@@hash.each do |key, value|
				if key.include?(word)
					element = [value, word]
					result.push(element)
				end
				return result
			end
		end
	end
end

