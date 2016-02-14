class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  attr_accessor:word
  attr_accessor:guesses
  attr_accessor:wrong_guesses
  # Get a word from remote "random word" service

  #def initialize()
    
 # end

  
  def initialize(word)
    @word = word
    @guesses= ''
    @wrong_guesses=''
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
  
  
    #find if the letter has already been guessed
      #if guessed, ignore
      #else, check if it is correct
      # add to list
      
  
  
  def guess(letter_guess)
    existed=false
    correct=false
    #check if valid
    
    if (letter_guess=='') || (letter_guess==nil) || (/[a-zA-Z]/.match(letter_guess)==nil)
      raise ArgumentError.new("invalid input")
    end
   
   letter_guess.downcase!
     if !@guesses.empty?
       @guesses.each_char do |c|
            if c==letter_guess
              existed=true
              break
            end
          end
     end
          
          
      if existed ==false
        if !@wrong_guesses.empty?
         @wrong_guesses.each_char do |c|
            if c==letter_guess
              existed=true
              break
            end
          end
        end
      end
        
        #check if correct
        if existed ==false
           @word.each_char do |letter_correct|
             if letter_guess==letter_correct
               @guesses=@guesses+letter_guess.to_s
               correct=true
               break
             end
           end
           
           if correct==false
             @wrong_guesses=@wrong_guesses+letter_guess.to_s
           end
        else
          return false
        end
        
  end
  
=begin
word = banana
@test_cases = {
      'bn' =>  'b-n-n-',
      'def' => '------',
      'ban' => 'banana'
    }
=end
  def word_with_guesses
    retval=""
    @word.each_char do |x|
      if @guesses.include?(x)
        retval=retval+x
      else
        retval=retval+"-"
      end
    end
    return retval
  end
  
  def check_win_or_lose
    
    if @guesses.split('').sort.join('')==@word.split('').sort.join('')
      return :win
    end
    
    if wrong_guesses.length==7
      return :lose
    end
    
    return :play
      
  end
  

 
  
end
#let me try run