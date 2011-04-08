class Test

  def fun(p1, p2, p3)
    if !p1.kind_of?(Integer) || !p2.kind_of?(Integer) || !p3.kind_of?(Integer)
      raise ArgumentError.new('Arguments must be integers')
    end
    x = 0
    p1.step(p2, p3) { |i|
      x += yield i
    }
    x
  end
  
end

def main
  t = Test.new()

  y = t.fun(10, 20, 2) {|i| i / 2 }  # / is integer division
  puts y
  
  y = t.fun(5, 25, 5) {|i| i % 2}   # % is remainder operator
  puts y
  
  y = t.fun(1, 24, 4) {|i| i.next}   # i.next returns i + 1
  puts y
end 

# call main
main()