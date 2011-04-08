# 
# Money class that demonstrates the defines an operator (+) on Money objects
# and includes the Comparable module.
#
class Money
  
  # Module that includes instance method for comparison (<, <=, ==, >, >=) and between?
  include Comparable
  
  # initialize object after creation
  def initialize(dollars=0, cents=0)
    @dollars = dollars
    @cents = cents
  end

  # getter  method for instance variable @dollars
  def dollars
    @dollars
  end
   
  # setter method for instance variable @dollars
  def dollars=(dollars)
    @dollars = dollars
  end
   
  # getter method for instance variable @cents
  def cents
    @cents
  end
   
  # setter method for instance variable @cents
  def cents=(cents)
    @cents = cents
  end

  #attr_reader  :dollars, :cents
  #attr_writer  :dollars, :cents
  
  # adds two money objects and returns a new Money object
  def +(m2)
    d = @dollars + m2.dollars
    c = @cents + m2.cents

    if c >= 100
      d = d + 1
      c = c % 100
    end
    return Money.new(d,c)   # use of "return" is optional
  end   

  def totalCents
    @dollars * 100 + @cents
  end
  
  # determine relative ordering between this money object against the moneyObj and 
  # return -1, 0, 1 (similar to compareTo method of Comparable interface in Java)
  def <=>(moneyObj)
    if moneyObj.instance_of?(Money)
      if totalCents < moneyObj.totalCents
        -1
      elsif totalCents == moneyObj.totalCents
        0
      else
        1
      end
    end
  end
  
  # return string representation of Money object
  def to_s
    '$' + @dollars.to_s + '.' + @cents.to_s
  end 
  
end

#
# Driver code
#
def main
  # create two money objects
  m1 = Money.new(10,50)
  m2 = Money.new(12,75)
      
  # add two money objects
  puts "#{m1} + #{m2} = " + (m1 + m2).to_s

  # compare two money objects
  puts "#{m1} == #{m2}? " + (m1 == m2).to_s  
  puts "#{m1} != #{m2}? " + (m1 != m2).to_s
  puts "#{m1} < #{m2}? " + (m1 < m2).to_s
  puts "#{m1} <= #{m2}? " + (m1 <= m2).to_s
  puts "#{m1} > #{m2}? " + (m1 > m2).to_s
  puts "#{m1} >= #{m2}? " + (m1 >= m2).to_s
  
  # create two more money objects and test between? method
  m3 = Money.new(9,50)
  m4 = Money.new(12,0)
  puts "#{m1} between #{m3} and #{m4}? " + m1.between?(m3,m4).to_s
  puts "#{m2} between #{m3} and #{m4}? " + m2.between?(m3,m4).to_s
end

# call the main function
main()
