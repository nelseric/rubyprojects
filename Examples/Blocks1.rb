#
#  Example that shows use of blocks in Ruby
#
class Test

  # instance method
  def hello
    puts("I will yield twice")
    yield
    yield
  end
  
  # class method 
  def Test.hello
    yield
    yield
    yield
    puts("I yielded three times")
  end
  
  def bye
    if block_given?
      yield
    else
      puts("Bye world!")
    end      
  end
  
  def count
    for i in 1..10
      yield(i, i*i)
    end
  end
  
end

#
#  Driver code
#
def main
  t = Test.new()
  
  t.hello { puts("Hi John!") }
  puts    # blank line
  
  Test.hello do
    puts("Hi Kevin!")
  end
  puts    # blank line
  
  t.bye { puts("Bye John!") }
  puts    #blank line
  
  t.bye
  puts    # blank line
  
  t.count { |p, q| puts("#{p}  #{q}") }
 
end 

# call main function
main()
