class Test
    # 2 parameter method
    def self.sub(a, b)
        puts(a - b)
    end
    
    # 3-parameter method overwrites 2-parameter
    def self.sub(a, b, c)
        puts(a - b - c)
    end
    
    # Subprogram overloading by args
    def self.print(*args)
        case args.size
            when 1
                puts "1: An argument has been entered: #{args[0]}"
            when 2
                puts "2: Two arguments were entered: #{args[0]}, #{args[1]}"
        end
    end
    
    # num - 2 is returned without a return statement (Implicit Return)
    def self.sub_two( num)
        num - 2
    end
    
    # num - 2 is returned with a return statement
    def self.sub_two_return( num)
        return num - 2
    end
    
    # explicit return ( stop and return sth )
    def self.sub_two_explicit( num)
        puts "explicit return"
        
        return "returned explicitly without finishing"
        
        num - 2
    end
    
    # main.rb:41:in `<class:Test>': unexpected return (LocalJumpError)
    # return 42
    
    # return more than one element in single statement
    def self.multiple_return()
        return "individual ", "returned ", "values"
    end
    
    # partially nested sub program
    def sub1()
        def sub2()
            puts "Sub2 method inside sub1 is executed."
        end
        sub2()
    end
    
    _local = 5
    
    # variable is accessible from inner scope
    def self.loc()
        _local = 6
    end
    
    # variable is not accessible from outer scope
    def self.outer()
        def self.inner()
            local = 10
        end
        self.inner()
        # main.rb:69:in `outer': undefined local variable or method `local' for Test:Class (NameError)
        # puts "Local variable from outer: #{local}"
    end
    
    # pass by value example
    def self.passbyval( arg)
        arg = arg + 1
    end

  
end

puts "Subprogram Overloading Test"
# main.rb:6:in `sub': wrong number of arguments (given 2, expected 3) (ArgumentError)
#Test.sub(1,2)

# The last defined method [self.sub(a, b, c)] runs and -4 is printed.
Test.sub(1, 2, 3)

# Subprogram overloading with class methods
Test.print "First" 
Test.print "First", "Second"

puts "\nReturn Test"
puts "Without return statement: #{Test.sub_two( 5)} "
puts "With return statement: #{Test.sub_two_return( 5)} "
puts "Explicit return test: #{Test.sub_two_explicit( 5)}"
puts Test.multiple_return()

# Nested Subprogram Definitions
puts "\nNested Subprogram Definitions"
Test.new.sub1()

# Scope of local variables
puts "\nScope of local variables"
puts Test.loc()
Test.outer()

# Parameter Passing Methods
puts "\nParameter Passing Methods"
sayi = 3
puts "pass by value worked: #{Test.passbyval( sayi)}"
puts sayi

# Closure Examples
puts "\nClosure Examples"
arr = ["item1", "item2", "item3"]
    
# example BLOCK
arr.each do | item |
    puts item
end

# Proc closure test
test = Proc.new{"New Proc statement"}
puts test.call

# Lambda closure test
lambda_exp = ->(x){ x / 2 }
puts lambda_exp.call(10)
lambda_exp = lambda{"lambda statement"}
puts lambda_exp.call

puts "middle part worked"

# for in do end keywords
for i in 1..3 do
  puts i
end

var = 4

# until do keywords
until var == 6 do
  puts var
  var = var + 1
end

# if elsif else keywords
if var == 6
   puts "var is 6"
elsif var != 6
   puts "elsif var is not 6"
else
   puts "else"
end

# while do next break keywords
a = 6
num = 8
while a < num do
   if a == 6
     next
   if a == 7
     break
   end
   puts a
   a +=1
end
end