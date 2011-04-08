#
# defining a class in Ruby
#
class Customer
  
  # generate getter and setter methods for instance variables @name, @age, and @id
  attr_accessor :name, :age, :id
  
  def initialize(name="Nope", age=0, id="XXX")
    @name = name
    @age = age
    @id = id
  end
  
  def to_s
    "#{name} #{age} #{id}"
  end
  
end

def main
	c1 = Customer.new("John",35,"1234")
	puts(c1)

	c2 = Customer.new
	puts(c2)

	c2.name= "Kevin"
	c2.age= 20
	c2.id= "C456"
	puts(c2.name)
	puts(c2.age)
	puts(c2.id)
end

# invoke main function
main()

