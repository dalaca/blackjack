#Object ceom from classes
#Classes contain behaviours and states 
# objects are manifestations of those states. (object = joe)
# eg. @instance variable capture the state of the instance, and accessable
#in other methods in the same class
#behaviours corrilate to methods (swimming, running, etc) 
class Person

	@@count = 0 

	attr_accessor :name, :weight, :height
#write wha tthe person class is capible of doing. Cookie cutter = class 
	def initialize(name, weight, height)
		@name = name
		@weight = weight
		@height = height
		@@count += 1
	end

	def details
		puts "#{name}: weight of #{weight} and height of #{height}"
	end

	def change_info(new_name, new_weight, new_height)
		self.name = new_name
		self.weight = new_weight
		self.height = new_height
		#we use the self.method because it's using the setter mathod rather than the instance
		#variable and allows to scrub the data, if need be.
	end

	def self.total_people
		puts "#{@@count}"
	end
end


joe = Person.new('joe', 120, 150)
bob = Person.new('bob', 130, 170)
kim = Person.new('kin', 120, 140)

puts joe.name

joe.name = 'Joeseph'
puts joe.name

joe.details
bob.details

bob.change_info('Robert', 150, 200)
bob.details

Person.total_people