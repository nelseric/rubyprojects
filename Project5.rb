# Author: Eric Nelson

def main
  loaded = Hash.new
  done = false
  while !done
    print("Enter a ruby source filename to inspect: ")
    filename = gets.chomp
    begin

      if !loaded.key?(filename) then
        before = Module.constants
        require(filename)
        types = Module.constants - before
        loaded[filename] = types
      else
        types = loaded[filename]
      end
      puts("The file #{filename} contains the following #{types.length()} types: ")

      (1..types.length()).each {|num| puts "#{num}. #{types[num-1]}"}

      examining = true
      while examining
        print("Do you want to examine a type further (y or n)? ")
        s = gets.chomp
        if s == 'y' or s == 'yes'
          print("Enter the number of the type to examine further: ")
          tnum = gets.chomp.to_i-1
          if types[tnum] != nil
            #----- Examining
            t = Module.const_get(types[tnum])
            puts "    Type: #{t.name}"
            puts "    Super class: #{t.superclass}" if t.kind_of?(Class)
            puts "    Ancestors: #{t.ancestors}"
            puts "    Included modules: #{t.included_modules}"
            puts "    Constants: #{t.constants}"
            puts "    Class variables: #{t.class_variables}"
            puts "    Class methods: #{t.singleton_methods(false)}"
            puts "    Public instance methods: #{t.public_instance_methods(false)}"
            puts "    Protected instance methods: #{t.protected_instance_methods(false)}"
            puts "    Private instance methods: #{t.private_instance_methods(false)}"
          else
            puts "Not a valid number. Try again."
          end
        elsif s == 'n' or s == 'no'
          examining = false
        else
          puts "Please answer yes or no."
        end
      end
    rescue LoadError
      puts("Load Error: Could not load the file Test.rb. Try again..")
    end
  end
end

main