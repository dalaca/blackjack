
# you can only inherit from 1 superclass at a time. 
# you can overwrite the superclass with the sub class 
# When its and "IS A" relationships, we want to module through an inheritance
# when it's a "HAS A" relationship, it is a composition - through modules
# you can only make object from classes not modules. 

module Swimmable
	def swim
		puts "I'm swimming"
	end
end

module Chewable
	def chew
	puts "I'm chewing"
	end
end


class Animal
	attr_accessor :name
	def initialize(name)
		@name = name
	end
	
	def run
		puts "I'm running"
	end
end

class Mammal < Animal
	def warm_blooded?
		true
	end
end


class Dog < Mammal
	include Swimmable
	include Chewable

	def run
		puts "I run faster!"
	end
end

class Cat < Mammal
	
end

teddy = Dog.new('teddy')
kitty = Cat.new('kitty')

puts teddy.name
puts kitty.name 

teddy.run
kitty.run
teddy.swim
teddy.chew
