def f
  return 3
end

def fib(n)
    if (n == 0)
        return 0
    elsif (n == 1)
        return 1
    else 
      return fib(n-1) + fib(n-2)
    end
end

def main
    m = f(fib(10000))
    puts m
end

# call  main function
main
