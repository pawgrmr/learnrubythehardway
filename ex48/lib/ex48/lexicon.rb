class Lexicon

	# def self.scan(word)
	# 	#scan for the word and place it into an array of array [token, word] pairing
	# 	#?trial a while loop => while word == @@direction key return []

	# 	@@direction = { #assign hash to class var @@direction
	# 		"north" => ['direction', 'north'],
	# 		"south" => ['direction', 'south'],
	# 		"east" => ['direction', 'east']
	# 	}

	# 	pair = @@direction.assoc("word") #do the same for the words north, south and east - convert user input words for direction into [token word] pair.
	# 	elements = [] #want to push the array of token, word pairing to this array

	# 	elements.each do |element|
	# 		if word == h.key(word) #word == hash key 			
	# 			elements.push(h.value)
	# 		else 
	# 			return nil
	# 		end
	# 	end
	# end

def self.scan(sentence)

result = sentence.split

	hash = {
		'direction' => ['north', 'south', 'east']
	}
	
	elements = [['direction', 'north']]

	hash.each do |key, value|
		if result == "#{value}"
			element.push("[#{key}, #{value}]")
		else
			return nil
		end
	end
end
end






#take each of the words and #if word matches the value in the direction hash, 
#return it as an array of array with (word, [[direction, word]]) pairing.
#push this into the empty array


# require 'ex48/lexicon.rb'
# require "test/unit"


# class TestLexicon < Test::Unit::TestCase

#   def test_directions()
#     assert_equal(Lexicon.scan("north"), [['direction', 'north']])
#     result = Lexicon.scan("north south east") #split these words

#     assert_equal(result, [['direction', 'north'], #i.e. assert equal(result, [])
#            ['direction', 'south'],
#            ['direction', 'east']])
#   end
# end
