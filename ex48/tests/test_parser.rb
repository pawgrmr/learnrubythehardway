# For Exercise 49, write a complete test that confirms everything in this code is working. 
# Put the test in tests/test_parser.rb similar to the test file from the last exercise. 
# That includes making exceptions happen by giving the parser bad sentences.

# Check for an exception by using the function assert_raise from the Test::Unit documentation. 
# Learn how to use this so you can write a test that is expected to fail, which is very important in testing. 
# Learn about this function (and others) by reading the Test::Unit documentation.

require 'ex48/parser.rb'
require "test/unit"


class TestParser < Test::Unit::TestCase

def test_peek()
	assert_equal(Sentence.peek([["verb", "run"], ["noun", "princess"]]), "verb")
end


def test_match()
	assert_equal(Sentence.match([["noun", "princess"], ["verb", "eat"]], "noun"), ["noun", "princess"], "noun")
end

def test_skip()
	assert_equal((Sentence.skip([["stop", "the"], ["verb", "eat"]], "stop")), nil)
end

def test_parse_subject()
	assert_equal((Sentence.parse_subject([["noun", "princess"], ["verb", "eat"]])), ["noun", "princess"], ["noun", "player"])
	assert_equal((Sentence.parse_subject([["verb", "eat"],["noun", "princess"]])), ["noun", "player"])
	assert_equal((Sentence.parse_subject([["noun", "princess"], ["stop", "the"]])), ["noun", "princess"])
	assert_not_equal((Sentence.parse_subject([["verb", "eat"], ["noun", "princess"]])), ["verb", "eat"], ["verb", "player"])
	assert_raise ParserError do 
		Sentence.parse_subject(nil)
	end
	assert_raise ParserError do 
		Sentence.parse_subject(["direction", "north"])
	end
end

def test_verb()
	assert_equal(["verb", "run"], (Sentence.parse_verb([["verb", "run"], ["noun", "bear"]])))
	assert_raise ParserError do
		Sentence.parse_verb([["direction", "north"], ["noun", "bear"]])
	end
end

def test_object
end

def test_sentence
end

end

