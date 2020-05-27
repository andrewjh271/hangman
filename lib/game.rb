# require_relative 'color'

class Game

  attr_reader :key

  def initialize
    @key = get_key
    @key_scratch = @key
    @key_clues = ""
    @key.length.times { @key_clues << "_" }
    @guessed = []
    @guesses = 12
  end

  def request_guess
    begin
      puts @key_clues.cyan
      puts
      puts "Enter a letter."
      guess = gets.chomp
      raise "Invalid input: #{guess}." unless /[[:alpha:]]/.match(guess) && guess.length == 1
      raise "You've already guessed that letter!" if @guessed.include?(guess)
      enter_guess(guess.downcase)
    rescue StandardError => e
      puts "#{e}".red
      retry
    end
  end

  def enter_guess(char)
    @guessed << char
    if @key.include?(char)
      add_clue(char)
      puts "Good guess!".green
    else
      @guesses -= 1
      puts "No luck! You have #{@guesses} guesses remaining.".yellow
    end
  end

  def over?
    if @key == @key_clues
      puts
      puts "You guessed the word!".cyan
      puts @key.cyan
      true
    elsif @guesses == 0
      puts "You couldn't guess the word!"
      puts @key.magenta
      true
    else
      false
    end
  end

  private

  def add_clue(char)
    @key.split('').each_with_index do |v, i|
      @key_clues[i] = char if v == char
    end
  end

  def get_key
    dictionary = File.open('5desk.txt', 'r')
    words = []
    dictionary.each_line do |l|
      l = l.chomp
      if l.length <= 12 &&
         l.length >= 5 &&
         /[[:lower:]]/.match(l[0])
        words << l
      end
    end
    dictionary.close
    words.sample
  end


end