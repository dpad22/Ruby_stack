class MathDojo
    # your code here
    attr_accessor :sum

    def initialize
        @sum = 0
    end

    def add (*numbers)
        numbers.flatten! # thisssssss saved my life!!!!!!!!!!!!!!!!!
        numbers.each {|i| @sum += i}
        self
    end
    
    def subtract (*numbers)
        numbers.flatten! # Returns a new array that is a one-dimensional flattening of self (recursively). That is, for every element that is an array, extract its elements into the new array.
        numbers.each {|i| @sum -= i}
        self
    end

    def result
        puts @sum
    end
end
challenge1 = MathDojo.new.add(2).add(2, 5).subtract(3, 2).result # => 4
challenge2 = MathDojo.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2,3], [1.1, 2.3]).result # => 23.15

