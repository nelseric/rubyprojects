#
# Point class demonstrates the following: class variables, class methods, defining various operators,
# defining <=> method to include methods from Comparable module, and simple use of blocks and yield
#
class Point

	include Comparable, Enumerable
	
	# class variable
	@@count = 0
	
	# generate getter and setter methods for @x and @y
	attr_accessor :x, :y
	
	# initialize the newly created Point object
	def initialize(x,y)
		@x = x
		@y = y
		@@count += 1
	end
	
	# class method
	def Point.count
		@@count
	end
	
	# check if this Point object is equal to the other object
	def ==(other)
		if other.instance_of?(Point)
			self.x == other.x && self.y == other.y
		else
			false
		end
	end
	
	# implement general comparison operator for use by methods in the Comparable module
	def <=>(other)
		return nil unless other.instance_of?(Point)
		Math.sqrt(@x**2 + @y**2) <=> 
					Math.sqrt(other.x**2 + other.y**2)
	end
	
	# returns string representation of this object
	def to_s
		"(#@x,#@y)"
	end
	
	def each
		yield @x
		yield @y
	end
	
	def sum
		s = 0
		s += yield @x
		s += yield @y
		s
	end
	
	def [](index)
		case index
			when 0, "x" then @x
			when 1, "y" then @y
		end
	end
	
	def []=(index,value)
		case index
			when 0, "x" then @x = value
			when 1, "y" then @y = value
		end
	end
	
	def +(other)
		Point.new(@x + other.x, self.y + other.y)
	end
	
	def *(scalar)
		# to be completed
	end
	
	# unary minus method
	def -@(other)	
		# to be completed
	end
	
end

# global function to drive the program
def main
	p = Point.new(5,10)
	r =  Point.new(2,2)
	q = Point.new(1,0)
	puts(p.x())
	puts(p == q)
	puts(p < q)
	puts(p > q)
	
	s = p.sum do 
		|v| 2 * v
	end
	puts(s)
	
	puts(p["x"])
	puts(p["y"])
	
	p["x"] = 15
	p["y"] = 20
	puts(p)
end

# invoke driver function
main

