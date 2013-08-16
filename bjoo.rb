#Building Objects

#Remember to Rap this up at the end, when the App is done. 
=begin
module BlackJack
end


module CardTotal
	def card_total
	end
end
=end

class Card
	attr_accessor :suit, :rank
	
	def initialize(suit, rank)
		@suit = suit
		@rank = rank
	end

	def card_output
		puts "#{self.rank} of #{self.suit}"
	end

	def to_s
		card_output
	end
end


class Deck
	attr_accessor :cards

	def initialize
		@cards = [] 
		['Diamonds', 'Hearts', 'Spades', 'Clubs'].each do |suit|
			['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |rank|
				@cards << Card.new(suit, rank)
			end
		end
		scramble!
	end

	def scramble!
		cards.shuffle!
	end

	def deal_one
		cards.pop
	end

	def cards_size
		cards.size
	end
end

module Hand
	attr_accessor :cards
	def initialize(cards)
		
	end

	def hand
		self.cards	
	end

	def hit
		card.pop
	end

	def stay
		puts 'You decided to stay'
	end

	def bust
		puts 'you bust'
		#restart game
	end
end

class Player 
	include Hand
	attr_accessor :name, :cards
	def initalize(name)
	@name = name 
	@cards = cards
	end
end


class Dealer
	include Hand
	def initialize
	@name = "Dealer"
	@cards = cards
	end
end


class Counter
	def initialize(counter)
	end
end

player = Player.new("dave")
deck = Deck.new