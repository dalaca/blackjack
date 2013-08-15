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
		@cards.shuffle!
	end

	def deal_one
		cards.pop
	end

	def cards_size
		cards.size
	end
end



=begin
class Player
	def initalize
	end

	def number_of_players
	end

	def player_turn
	end

end

class Dealer
	def initialize
	end

	def dealer_turn
	end
end

class Hand
end

class Counter
	def initialize(counter)
	end
end


puts Deck.new
=end