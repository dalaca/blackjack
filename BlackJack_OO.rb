require 'rubygems'
require 'pry'

class Card
	attr_accessor :suit, :rank
	def initialize(suit, rank)
		@suit = suit
		@rank = rank
	end

	def pretty_output 
		puts "#{rank} of #{suit}"
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

	def deal_card
		cards.pop
	end

	def size
		card.size
	end
end

module Hand 
	attr_accessor :cards
	def initialize

	end
	
	def add_card(new_card)
		cards << new_card
	end
	
	def show_hand
		puts "-------------------"
		puts "#{name}'s Cards are:"
			cards.each do |card|
			puts "#{card.pretty_output}"
		end
		puts "Total card value: #{total}"
	end

		def total
		face_values = cards.map{|card| card.rank}
		total = 0
		face_values.each do |v|
			if v == "A"
				total += 11
			elsif v.to_i == 0
				total += 10
			else
				total += v.to_i
			end			
		end
		
		#correct for aces
		face_values.select{|v| v == "A"}.count.times do
			break if total <= BlackJack::BLACK_JACK
			total-= 10
		end

		total
	end

	def is_busted?
		total > BlackJack::BLACK_JACK
	end
end	

class Player
	include Hand
	attr_accessor :name, :cards
	def initialize(name)
		@name = name
		@cards = []
	end
end

class Dealer 
	include Hand
	attr_accessor :name, :cards
	def initialize
	
		@name = "Dealer"
		@cards = []

	def show_hand
		puts "-------------------"
		puts "#{name}'s Card is:"
		puts "First Card Covered"
		puts "#{cards[1].pretty_output}"
	end
	end
end


class BlackJack

	BLACK_JACK = 21
	DEALER_MIN = 17
	attr_accessor :deck, :dealer, :player
	def initialize()
		@deck = Deck.new
		@player = Player.new("Player1")
		@dealer = Dealer.new
	end

	def set_player_name
		puts "What is your Name?"
		player.name = gets.chomp
	end

	def deal_cards
		player.add_card(deck.deal_card)
		dealer.add_card(deck.deal_card)
		player.add_card(deck.deal_card)
		dealer.add_card(deck.deal_card)
	end
	
	def show_hands
		player.show_hand
		dealer.show_hand
	end
	
	def black_or_bust?(player_or_dealer)
		if player_or_dealer.total == BLACK_JACK
			if player_or_dealer.is_a?(Dealer) 
				puts "Dealer hit BlackJack - #{player.name} loses"
			else 
				puts "Congrats #{player.name} got BlackJack, you win"
			end
			restart?
		elsif player_or_dealer.is_busted?
			if player_or_dealer.is_a?(Dealer)
			puts "Congrats, dealer busted, you win"
			else
			puts "Sorry, you busted, you lose"
			end	
			restart?		
		end
	end

	def player_turn
		puts "#{player.name}'s turn"

		black_or_bust?(player)
		while !player.is_busted?
			puts "Do you want to 1) Hit or 2) Stay?"
			action = gets.chomp
			
			if action == '1'
				new_card = deck.deal_card
				puts "Dealing card: #{new_card.pretty_output}"
				player.add_card(new_card)
				puts "#{player.name}'s total is now: #{player.total}"
			elsif action == '2'
				puts "#{player.name} Stayed"
				break
			end
			black_or_bust?(player)
		end
		puts "#{player.name} stays at #{player.total}"
	end
	
	def dealer_turn
		puts "Dealer's Turn"
		black_or_bust?(dealer)
		while dealer.total < DEALER_MIN
			new_card = deck.deal_card
			puts "Dealing card: #{new_card.pretty_output}"
			dealer.add_card(new_card)
			puts "Dealer total: #{dealer.total}"
			black_or_bust?(dealer)
		end
		puts "Dealer stays at #{dealer.total}"
	end

	def who_won?
		if player.total > dealer.total
			puts "Congrats, #{player.name} wins"
		elsif player.total < dealer.total
			puts "Sorry, Dealer wins"
		else player.total == dealer.total
			puts "Looks like a tie"
		end
		restart?
	end

	def restart?
		puts "Would you like to 1) replay 2) exit?"
		action = gets.chomp
		if action == '1'
			 deck = Deck.new
			 player.cards = []
			 dealer.cards = []
			 start
		else 
			puts "Goodbye"
			exit
		end
	end

	def start
	set_player_name
	deal_cards
	show_hands
	player_turn
	dealer_turn
	who_won?
	restart?
	end
end

game = BlackJack.new
game.start