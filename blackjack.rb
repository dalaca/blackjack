#Black Jack
#David C
#August 2013

def counter(hand_delt)

	arr = hand_delt.collect{|c| c[1]}

#counts cards
total_count = 0
	arr.each do |value|
		if value == 'A'
			total_count += 11
			elsif value.to_i == 0 
			total_count += 10
			else
			total_count += value.to_i
		end
	end

		#correcting aces
		arr.select{|e| e == "A"}.count.times do
			if total_count > 21
				total_count -= 10
			end
		end
		return total_count
end

def restart(replay)
  puts "Do you want to play again? 1) Yes 2) No"
  replay = gets.chomp
  	replay
end

#create the deck
suits = ['Diamonds', 'Hearts', 'Spades', 'Clubs']
ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(ranks)
deck.shuffle!

	

replay = '0'

while replay != '2' 

	puts 'Time to play BLACKJACK!'
	puts ''
	#deal cards
	
	user_cards = []
	dealer_cards = []

	user_cards << deck.pop
	dealer_cards << deck.pop
	user_cards << deck.pop
	dealer_cards << deck.pop

	#calculate card values
	user_total = counter(user_cards)
	dealer_total = counter(dealer_cards)

	while dealer_total < 17
		dealer_cards << deck.pop
		dealer_total = counter(dealer_cards)
		
	end


	puts ''

	action = '0'
	while action != '2' 
		puts "You have #{user_cards[0...5]}, totaling #{user_total}"
		puts "Dealer has #{dealer_cards[0...5]}, totaling #{dealer_total}"
		puts "Do you want to 1)hit or 2)stay?"
		action = gets.chomp
		#player hits
		if action == '1'
			user_cards << deck.pop
			user_total = counter(user_cards)
		#player stays
		elsif action == '2'
			puts "You stayed with #{user_cards[0...5]}, totaling #{user_total}"
		end
	end


	#compare cards
	if dealer_total > 21
		puts 'Dealer Busts'
		replay = restart(replay)
	elsif dealer_total == user_total
		puts 'Tie Game'
		replay = restart(replay)
	elsif user_total > 21
		puts 'You Busted'
		replay = restart(replay)
	elsif user_total > dealer_total
		puts 'You Win'
		replay = restart(replay)
	elsif user_total < dealer_total
		puts 'you Lose'
		replay = restart(replay)
	end
end

