#
# class FirstClass
#
class FirstClass
  
  include Comparable
  
  #  define two constants
  Constant1 = 100
  Constant2 = 12.75
  
  # define three class/static variables
  @@cvar1 = 10
  @@cvar2 = [10, 20]
  @@alphabet = {"A" => "Apple", "B" => "Boy"}
  
  # define a class/static method
  def FirstClass.method1
    "Hello from static method SomeClass.method1"
  end
  
  # define two public instance methods
  def method2
    "Hello from method2!!"
  end
  
  def method3
    "Hello from method3!!"
  end
  
  # define two protected instance  methods
  protected
  
  def method4
    "Hello from method4!!"
  end
  
  def method5
    "Hello from method5!!"
  end
  
  # define two private instance  methods
  private

  def method6
    "Hello from method6!!"
  end
  
  def method7
    "Hello from method7!!"
  end
  
end

#
# class Student
#
class Student
	
	def initialize(name,gnbr,age)
		@name = name
		@gnbr = gnbr
		@age = age
	end
		
	attr_accessor   :name, :gnbr, :age
	
	def to_s
		"#@name #@gnbr #@age"
	end
	
end

#
# class GradStudent
#
class GradStudent < Student

	attr_accessor	:specialty, :advisor
	
	def initialize(name, gnbr, age, specialty, advisor)
		super(name,gnbr,age)
		@specialty = specialty
		@advisor = advisor
	end
	
end

#
# module Binary
#
module Binary

	def Binary.to_bin(num)
		bin = sprintf("%b", num)
	end
	
	def to_bin(num)
		bin = sprintf("%b", num)
	end
	
end

#
# module Base64
#
module Base64

	def Base64.encode(data)
		
	end
	
	def Base64.decode(text)
		
	end
	
end

#
# module Dice
#
module Dice

	def roll
		r_1 = rand(6)
		r_2 = rand(6)
		r1 = r_1 > 0 ? r_1 : 1
		r2 = r_2 > 0 ? r_2 : 1
		[r1, r2]
	end
	
end

#
# class Game
#
class Game
	include Dice
end


