
class ParserError < Exception 
end
#convert scanned sentence into array of sentence objects 
  #loop through scanned words

  #match types of tuples 

  #peek at a potential tuple: look at the next element in our tuple array, and then match to take one off and work with it.

  #skip things dont care about

  #sentence object to put results in. Needs to have 3 attributes:
    #Sentence.subject - noun
    #Sentence.verb - verb
    #Sentence.object - noun


class Sentence

  def initialize(subject, verb, object)
    # take the array pairs ['noun', 'princess'] and convert them
    @subject = subject[1] #i.e. this will be princess and so on
    @verb = verb[1]
    @object = object[1]
  end

  attr_reader :subject
  attr_reader :verb
  attr_reader :object 



  def self.peek(word_list)
    #peek at a list of words and return the type of word it is
      if word_list
        word = word_list[0]
        return word[0]
      else
        return nil
      end
  end


  def self.match(word_list, expecting)
      if word_list
        word = word_list.shift #take the word off the list

          if word[0] == expecting #confirm word is the right type
            return word 
          else
            return nil
          end
      else
        return nil
      end
  end


  def self.skip(word_list, word_type)
    #skip words that arent going to be useful in the Sentence - "stop words"
    while self.peek(word_list) == word_type
      self.match(word_list, word_type)
    end
  end


  def parse_subject(word_list)
  skip(word_list, 'stop')
  next_word = peek(word_list)

      if next_word == 'noun'
        return match(word_list, 'noun')
      elsif next_word == 'verb'
        return ['noun', 'player']
      else
        raise ParserError.new("Expected a verb next.")
      end
  end

  def parse_verb(word_list)
    skip(word_list, 'stop') # skip all the stop words (see lexicon.rb)

      if peek(word_list) == 'verb'
        return match(word_list, 'verb')
      else
        raise ParserError.new("Expected a verb next.")
      end
  end


  def parse_object(word_list)
    skip(word_list, 'stop')
    next_word = peek(word_list)

      if next_word == 'noun'
        return match(word_list, 'noun')
      elsif next_word == 'direction'
        return match(word_list, 'direction')
      else
        raise ParserError.new("Expected a noun or direction next.")
      end
  end


  def parse_sentence(word_list)
    subject = parse_subject(word_list)
    verb = parse_verb(word_list)
    object = parse_object(word_list)
  

    return Sentence.new(subject, verb, object)
  end

end
