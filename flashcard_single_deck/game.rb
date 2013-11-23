require_relative 'flashcards.rb'

class Game

  attr_reader :deck

  def initialize(file)
    @deck = MakeDeck.create_deck(file)
    puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!"
    play_game
  end

  def draw_new_card
   @deck.sample
  end

  def play_game   
        card = draw_new_card 
    while true

      puts "Definition:"
      puts card.definition
      user_input = gets.chomp
      
      break if user_input == "BLAMMO"
      
      if card.is_true?(user_input) 
        puts "YAYYYYY!!!!!!!!!"
        card = draw_new_card
      else
        puts "Incorrect! Try again."
      end
    end
  end
end

Game.new('flashcard_samples.txt')
