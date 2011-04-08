class Test

  def sum
    x = 0
    for i in 1..10
      x += yield i
    end
    x
  end
  
end

def main
  t = Test.new()
  
  y = t.sum {|i| i * i }
  puts y
  
  y = t.sum {|i| i % 2}   # % is remainder operator
  puts y
  
  y = t.sum {|i| i.next}    # i.next returns i + 1
  puts y
end 

# call main
main()