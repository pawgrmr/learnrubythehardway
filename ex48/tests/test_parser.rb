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
	assert_equal(Sentence.peek(["verb", "run"]), "verb")
	result = Sentence.peek(["verb", "run"])
	assert_equal(result, ["verb"])
end

def test_match()
	assert_equal(Sentence.match([["noun", "princess"], ["verb, eat"]]), ["noun", "princess"], "noun")
	result = Sentence.match([["noun", "princess"], ["verb, eat"]])
	assert_equal(result, ["noun"])
end

def test_skip
end

def test_subject
end

def test_verb
end

def test_object
end

def test_sentence
end

end
