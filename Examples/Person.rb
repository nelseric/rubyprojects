class Person
  
  def initialize(name,age)
    @name = name
    @age = age
  end
  
  def to_s
    "#{@name} #{@age}"
  end
  
  def name(tag="25")
    @name + tag
  end
  
end

class Horse
  
  @name = "Easy Jet"
  
  def name
    puts @name
  end
  
end

h = Horse.new
h.name

p = Person.new("John", 30)
puts p.name
puts p.name("50");

puts "Hello " + " Jag!"
puts "Hello " << " Jag!"

