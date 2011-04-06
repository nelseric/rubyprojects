#
# CIS 343, Winter 2011
# Project 4
# Author: Your Name(s)
#

#
# A class that represents a card used in card games
#    rank of card: 'A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'
#    suit of card: 'c', 'd', 'h', 's'
#    string representation: rank followed by the suit - "8d", "Js"
#
class Card

  # generate getter methods for instance variables @rank and @suit
  attr_reader :rank, :suit

  @@ranks = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
  @@suits = ['c', 'd', 'h', 's']

  def self.ranks;
    @@ranks;
  end

  def self.suits;
    @@suits;
  end


  # initialize the instance variables with paramter values
  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  # setter method for instance variable @rank
  def rank=(rank)
    if @@ranks.include?(rank.to_s.upcase)
      @rank = rank
    else
      raise ArgumentError
    end
  end

  # setter method for instanve variable @suit
  def suit=(suit)
    if @@suits.include?(suit.to_s.downcase)
      @suit = suit.to_s.downcase
    else
      raise ArgumentError
    end
  end

  # returns string representation of Card object
  def to_s
    self.rank.to_s.upcase+self.suit.to_s.downcase
  end

end

#
# A class that represents a deck of 52 playing cards with an array of Card class defned above
#
class Deck
  @pack
  # initialize the array with 52 cards in the deck
  def initialize
    @pack = []
    possible = Card.ranks ** Card.suits
    possible.each { |combo| @pack.push(Card.new(combo[0], combo[1])) }
  end

  # method that shuffles the cards in the deck
  def shuffle
    @pack.shuffle!
  end

  # method to determine if the deck is empty
  def empty?
    @pack.empty?
  end

  # method that returns n number of cards from the deck
  def deal(n=1)
    if (n.is_a?(Integer) && n >= 1 && !@pack.empty?)
      @pack.pop(n)
    else
      nil
    end
  end

  # method that returns the number of cards in the deck
  def size
    @pack.size
  end

  def to_s
    pack_string = ''
    @pack.each { |card| pack_string+=card.to_s }
    pack_string
  end

end

#
# Open and add two methods to Ruby's Array class
#
class Array

  # method that returns the symmetric difference of self array and other array
  def ^(other)
    a = self.uniq
    if (!other.kind_of?(Array))
      b = [other]
    else
      b = other
    end
    anb = a - b
    bna = b - a
    anb + bna
  end

  # method that returns the cartesian product of self array and other array
  def **(other)
    if (!other.kind_of?(Array))
      other = [other]
    end
    self.product(other)
  end

end

#
# global function to test the functionality in the Card, Deck, and Array classes
#
def main
  # Test the methods of Card class
  c = Card.new('A', 's')
  puts(c)

  begin
    Card.new('15', 's')
  rescue ArgumentError => ex
    puts ex.message
  end

  begin
    Card.new('4', 'z')
  rescue ArgumentError => ex
    puts ex.message
  end

  begin
    c.rank= '15'
  rescue ArgumentError => ex
    puts ex.message
  end

  begin
    c.suit= 'z'
  rescue ArgumentError => ex
    puts ex.message
  end

  #Test the methods of Deck class
  d = Deck.new
  puts("\nNew deck of 52 cards: #{d}");

  d.shuffle
  puts("\nShuffled deck of 52 cards")
  puts("Deck size: #{d.size}")
  puts("Deck empty? #{d.empty?}")

  puts("\nDealing one card from the deck: #{d.deal()}")
  puts("Dealing one card from the deck: #{d.deal(1)}")
  puts("Dealing ten cards from the deck: #{d.deal(10)}")
  puts("Deck size after dealing: #{d.size}")

  d = Deck.new
  d.shuffle
  puts("\nNew shuffled deck of 52 cards")
  puts("Deck size: #{d.size}")
  puts("Dealing all cards from the deck: #{d.deal(52)}")
  puts("Deck empty? #{d.empty?}")
  puts("Deck size after dealing: #{d.size}")

  d = Deck.new
  d.shuffle
  puts("\nNew shuffled deck of 52 cards")
  puts("Deck size: #{d.size}")
  puts("Dealing all cards from the deck: #{d.deal(55)}")
  puts("Deck empty? #{d.empty?}")
  puts("Deck size after dealing: #{d.size}")

  # Test methods added to the Array class
  a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  b = [1, 3, 5, 7, 9, 11, 13, 15]
  c = [2, 4, 6, 8, 10, 12, 14, 16]

  d = a^b
  puts("\na ^ b:  #{d.sort}")

  d = a^c
  puts("\na ^ c:  #{d.sort}")

  d = b^c
  puts("\nb ^ c:  #{d.sort}")

  a = [1, 2, 3]
  b = [2, 3, 4, 5]
  c = a**b
  puts("\na ** b:  #{c}")

  # Test cases for invalid type value
  puts(Deck.new.deal(-10))
  puts(Deck.new.deal("Hello"))
  puts(Deck.new.deal(1.5))
  puts([1, 2, 3] ^ 5)
  puts([1, 2, 3] ** 5)
end

# invoke the main function
main()
