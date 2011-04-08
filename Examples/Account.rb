#
#   Example that shows exception handling in Ruby
#
class Account

  def initialize(id, balance)
    @id = id
    @balance = balance
  end
  
  def id
     @id
  end

  def balance
    @balance
  end

  def id=(value)
    @id = value
  end

  def balance=(value)
    @balance = value
  end
  
  def deposit(amount)
    if amount.kind_of?(Numeric) && amount > 0
      @balance += amount
    end
  end
  
  def withdraw(amount)
    if amount.kind_of?(Numeric) && amount > 0
      if amount > @balance
        raise InsufficientFundsException.new("Not enough funds to withdraw.")
      end
      @balance -= amount
    end
  end
  
  def to_s
    id.to_s + " " + balance.to_s
  end

end

# custom exception class
class InsufficientFundsException < Exception
  def initialize(msg)
    super msg
  end
end

#
# Driver code
#
def main
  a = Account.new(1234,150.00)
  puts(a)
  
  a.deposit(25)
  a.deposit(15.50)
  puts(a)

  # handling exceptions
  begin   # similar to "try" in Java
    a.withdraw(200)
  rescue InsufficientFundsException => exp    # similar to "catch" in Java
    puts(exp)
  ensure    # similar to "finally" in Java
    puts("Done with the exception block")
  end
  
end

# call main method
main
