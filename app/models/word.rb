class Word < ActiveRecord::Base
 #validates_presence_of :text
  def self.find_anagrams(string)
      # Create an array to store our anagrams
      anagrams = []
      # Convert word to an array of letters
      letters = string.split(//)
        # Loop through each letter in letters
        letters.each do |letter|
          # Select the remaining letters
          remaining = letters.select { |l| l != letter }
     
          # Create a new word by combining the letter + the remaining letters
          potential_anagram = letter + remaining.join('')
          if !Word.find_by_text(potential_anagram).nil?
                # Add new word to anagrams array
            anagrams << potential_anagram
          end
       
          # Create a new word by combining the letter + the reverse of the remaining letters
          # Add new word to anagrams array
          reverse_anagram = letter + reverse_letters(remaining).join('')   
          if !Word.find_by_text(reverse_anagram).nil?
                # Add new word to anagrams array
            anagrams << reverse_anagram
          end
        end  #end do loop
      # Return anagrams array
      return anagrams
  end
 
  def self.reverse_letters(letters)
    # create a new array of 2 items
    length = letters.length
    reversed_letters = Array.new(length)
 
    # loop through letters and keep index
    letters.each_with_index do |letter, index|
      reversed_letters[length - index - 1] = letter
    end
    return reversed_letters
  end
  
  def self.three_letters?(input)
    if input.length==3
      return true
    end
  end

  def self.distinct_letters?(input)
   letter_array = input.chars
   unique_letters = letter_array.uniq
   if unique_letters.length < letter_array.length
     false
   else
     true
   end
  end

  def self.valid_input(input)
      if input.length > 3
        raise Exception.new("Word must be less than or equal to 3 characters.")
      end
  end
end