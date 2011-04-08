#
# This source file contains classes and global functions to demonstrate the use of Ruby's Reflection API
#
class TestClass
  
  include Comparable
  
  #  define two constants
  Constant1 = 100
  Constant2 = 12.75
  
  # define three class/static variables
  @@cvar1 = 10
  @@cvar2 = [10, 20]
  @@alphabet = {"A" => "Apple", "B" => "Boy"}
  
  # define a class/static method
  def TestClass.method1
    "Hello from class method TestClass.method1"
  end
  
  # define two public instance methods
  def method2
    "Hello from method2!!"
  end
  
  def method3
    "Hello from method3!!"
  end
  
  # define two protected instance  methods
  protected
  
  def method4
    "Hello from method4!!"
  end
  
  def method5
    "Hello from method5!!"
  end
  
  # define two private instance  methods
  private

  def method6
    "Hello from method6!!"
  end
  
  def method7
    "Hello from method7!!"
  end
  
end


#
# main function that uses reflection API to display information on types in the "types" array
#
def test1()

  types = [TestClass, Numeric, Integer, Fixnum, Bignum, Float, Complex, String, Range, Array, Hash, NilClass, TrueClass,
                  FalseClass, Kernel, Math, Comparable, Enumerable]
  
  types.each do |t|
    
    # output type name using the "name" method from the Module class
    puts "Type Name: #{t.name}"
    
    # output type's superclass, if t is an instanceof Class.
    # use "superclass" method from the Class class
    print "Superclass: "
    print "#{t.superclass}" if t.kind_of?(Class)
    print "\n"

    # output modules included in the type
    # use "included_modules" method from the Module class
    print "Included Modules: "
    t.included_modules.each { |m| print "#{m} "}
    print "\n"
    
    # output constants defined in the type.
    # use "constants" method from the Module class
    print "Constants: "
    t.constants.each { |c| print "#{c} "}
    print "\n"
    
    # output class variables defined in the type, if any
    # use "class_variables" method from the Module class
    print "Class Variables: "
    t.class_variables.each { |c| print "#{c} "}
    print "\n"
    
    # output class/static methods defined in the type
    # use "singleton_methods" method from the Object class
    print "Class Methods: "
    t.singleton_methods(false).each { |m| print "#{m} "}
    print "\n"
    
    # output public instance methods defined in the type
    # use "public_instance_methods" from the Module class
    print "Public instance methods: "
    t.public_instance_methods(false).each { |m| print "#{m} "}
    print "\n"
    
    # output protected instance methods defined in the type
    # use "protected_instance_methods" from the Module class
    print "Protected instance methods: "
    t.protected_instance_methods(false).each { |m| print "#{m} "}
    print "\n"
    
    # output private instance methods defined in the type
    # use "private_instance_methods" from the Module class
    print "Private instance methods: "
    t.private_instance_methods(false).each { |m| print "#{m} "}
    print "\n\n"
  end
  
end

def test2()
	# use the "name" method from the Module class
	puts(TestClass.name)
	
	# use the "superclass" method from the Class class
	puts(TestClass.superclass)
	print("\n")
	
	# use the "ancestors" method from the Module class
	puts(TestClass.ancestors)
	print("\n")
	
	# use the "included_modules" method from the Module class
	puts(TestClass.included_modules)
	print("\n")
	
	# use the "constants" method from the the Module class
	puts(TestClass.constants(false))
	print("\n")
	
	# use the "class_variables" method from the Module class
	puts(TestClass.class_variables)
	print("\n")
	
	# "instance_methods" method from the Module class returns an array of public and protected instance methods
	puts(TestClass.instance_methods(false))
	print("\n")
	
	# "public_instance_methods" method from the Module class returns an array of public instance methods
	puts(TestClass.public_instance_methods(false))
	print("\n")
	
	# "protected_instance_methods" method from the Module class returns an array of protected instance methods
	puts(TestClass.protected_instance_methods(false))
	print("\n")
	
	# "private_instance_methods" method from the Module class returns an array of private instance methods
	puts(TestClass.private_instance_methods(false))
	print("\n")
	
	# "singleton_methods" method from the Object class returns an array of class methods
	puts(TestClass.singleton_methods(false))
	print("\n")
	
	# use "method_defined?" method from the Module class to determine if a module or class defines the named public or protected method
	puts(TestClass.method_defined?(:method3))
	
	# use "public_method_defined?" method from the Module class to determine if a module or class defines the named public method
	puts(TestClass.public_method_defined?(:method2))
	
	# use "protected_method_defined?" method from the Module class to determine if a module or class defines the named protected method
	puts(TestClass.protected_method_defined?(:method4))
	
	# use "private_method_defined?" method from the Module class to determine if a module or class defines the named private method
	puts(TestClass.private_method_defined?(:method6))
end

#
# invoke the main function
#
def test3()
	before = Module.constants

	filename = Dir.getwd + "/MyTestClass.rb"

	require(filename)

	types = Module.constants - before
	
	types.each do |type|
		t = Module.const_get(type)
		puts(t.name)
		print("\n")
	
		puts(t.superclass)
		print("\n")
	
		puts(t.ancestors)
		print("\n")
	
		puts(t.included_modules)
		print("\n")
	
		puts(t.constants(false))
		print("\n")
	
		puts(t.class_variables)
		print("\n")
	
		puts(t.instance_methods(false))
		print("\n")
	
		puts(t.public_instance_methods(false))
		print("\n")
	
		puts(t.protected_instance_methods(false))
		print("\n")
	
		puts(t.private_instance_methods(false))
		print("\n")
	
		puts(t.singleton_methods(false))
		print("\n")
	end
end

def test4()
	#invoking a class method TestClass.method1 using "send" method from Object class
	puts TestClass.send(:method1)
	
	#invoking a class method Math.log10(100) using "send" method from Object class
	puts Math.send(:log10, 100)
	
	#invoking an instance method upcase() using "send" method from Object class
	puts "hello".send(:upcase)
end

#invoke main function
test3()

