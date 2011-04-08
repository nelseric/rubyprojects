#
# RationalNum class represents a rational number and defines operations on
# rational numbers.
#
class RationalNum

	include Comparable
	
   def initialize(numerator=0, denominator=1)
      @numerator = numerator
      @denominator = denominator
      normalize
   end
    
   def numerator
      @numerator
   end
   
   def numerator=(aNumerator)
      @numerator = aNumerator
   end
   
   def denominator
      @denominator
   end
   
   def denominator=(aDenominator)
      @denominator = aDenominator
   end

   def + (r2)
      num = @numerator * r2.denominator + @denominator * r2.numerator
      den = @denominator * r2.denominator
      r = RationalNum.new(num,den)
      r.normalize
      return r
   end
   
   def - (r2)
      num = @numerator * r2.denominator - @denominator * r2.numerator
      den = @denominator * r2.denominator
      r = RationalNum.new(num,den)
      r.normalize
      return r
   end
   
   def * (r2)
      num = @numerator * r2.numerator
      den = @denominator * r2.denominator
      r = RationalNum.new(num,den)
      r.normalize
      return r
   end
   
   def / (r2)
      num = @numerator * r2.denominator
      den = @denominator * r2.numerator
      r = RationalNum.new(num,den)
      r.normalize
      return r
   end

  def <=>(rObj)
	  if @numerator * rObj.denominator() == @denominator * rObj.numerator
      return 0
	  elsif @numerator * rObj.denominator() < @denominator * rObj.numerator
	    -1    # same as "return -1"
	  else
	    1
	  end
  end
  
   def to_s
      @numerator.to_s + '/' + @denominator.to_s
   end
   
   def normalize
      val = gcd(@numerator,@denominator)
      @numerator = @numerator / val
      @denominator = @denominator / val
      if @denominator < 0 
        @numerator = - @numerator
        @denominator = - @denominator
      end
   end
   
   def gcd(a, b)
     if b == 0
       return a
     else
       return gcd(b, a % b)
     end
   end
   
   private :gcd
   
end

#
# driver code
#
def main
   choice = 'y'
   while choice == 'y'
      print "Enter two rational numbers: "
      
      # read a line and remove the last (end of line) character
      line = readline.chop!
      
      # extract the parts of the rational numbers entered matching a regular expression
      values = line.split(/\s+|\//)
      
      # create two rational objects
      r1 = RationalNum.new(values[0].to_i,values[1].to_i)
      r2 = RationalNum.new(values[2].to_i,values[3].to_i)
      
      # perform arithmeric operations and output results
      puts "#{r1} + #{r2} = " + (r1 + r2).to_s
      puts "#{r1} - #{r2} = " + (r1 - r2).to_s
      puts "#{r1} * #{r2} = " + (r1 * r2).to_s
      puts "#{r1} / #{r2} = " + (r1 / r2).to_s
      
      # perform relational operations and output results
      puts "#{r1} == #{r2} ==> " + (r1 == r2).to_s
      puts "#{r1} != #{r2} ==> " + (r1 != r2).to_s
      puts "#{r1} < #{r2} ==> " + (r1 < r2).to_s
      puts "#{r1} <= #{r2} ==> " + (r1 <= r2).to_s
      puts "#{r1} > #{r2} ==> " + (r1 > r2).to_s
      puts "#{r1} >= #{r2} ==> " + (r1 >= r2).to_s
      
      # got another set of inputs?
      print "Do you want to continue (y or n)? "
      choice = readline.chop!
   end
   puts "Bye for now!"
   
   # test between? method on relational objects
   r3 = RationalNum.new(1,2)
   r4 = RationalNum.new(3,4)
   r5 = RationalNum.new(1,4)
   puts r3.between?(r5,r4)
   puts r5.between?(r3,r4)
end

# call the main function
main()
