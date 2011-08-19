module Primes
  # Sieve of Eratosthenes for generation of a list of prime numbers.
  module Eratosthenes
    
    # The primary prime generation method for this module.
    #
    # This allows for switching between multiple implementations.
    def self.generate_primes(n=1024)
      def generate_primes_basic(n)
    end
    
    # This is the most straight-forward implementation, but is incredibly RAM
    # inefficient.
    def self.generate_primes_basic(n=1024)
      # First, we need to make the Array.
      # To make it easy later, we set the values to the index.
      # Note that this isn't meaningfully different in RAM usage or time than
      # only using booleans.
      list = Array.new(n+1) {|i| i}
      
      # Initialize some values that we don't want in our list later.
      list[0] = false
      list[1] = false
      
      # Try building up the multiples of all values.
      x = 2
      while(x*x <= n)
        
        # If we reach a value that is not marked as not prime, it is prime, and
        # we need to mark all its multiples as not prime.
        if( list[x] != false )
          (2..(n/x).floor).each do |a|
            list[a*x] = false
          end
        end
        
        x += 1
      end
      
      # Now we need to select out the ones that are not prime.
      return list.select {|n| n}
    end
  
  end
end