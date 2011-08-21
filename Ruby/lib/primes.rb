require_relative 'primes/helpers'
require_relative 'primes/eratosthenes'

module Primes
  # These are used for the fast_prime_tests, which can be proof positive, proof
  # negative, or undetermined.
  IS_PRIME = 1
  IS_COMPOSITE = -1
  IS_UNDETERMINED = 0
  
  # Returns true if the prime is true.
  def self.prime?(n)
    # To deal with 1 is a special case, and we grab anything negative while we're at it.
    return false if n<2
    
    # First check if it is composite using the fast prime tests.
    return false if fast_prime_test(n)==-1
    
    # Then we see if the first prime factor is not itse self.
    return first_prime_factor(n) == n
  end
  
  # Returns the first found prime factor, or n if it is prime.
  def self.first_prime_factor(n)
    # First check if it is prime using the fast_prime_filter.
    return n if fast_prime_test(n)==1
    
    # get the list of necessary primes and try to factor it.
    primes = primes_to( (Math.sqrt(n) + 0.5).floor ) # To be safe against rounding errors, we do (sqrt(n)+1).floor.  One extra test won't hurt.
    first_p = primes.find {|p| n%p==0}
    return first_p.nil? ? n : first_p
  end
  
  # Uses fast prime test algorithms.  Returns 1 if it is verifiably prime,
  # -1 if it is verifiably composite, and 0 if it is inconclusive.
  def self.fast_prime_test(n)
    return IS_UNDETERMINED
    #return Helpers.fermat_test_prime?(n, Math.sqrt(n).floor, 10.0)
  end
  
  # Returns a list of all the prime factors of the given number.
  def self.factors(n, factors=[])
    p = first_prime_factor(n)
    fs = factors<<p
    if(p==n)
      return fs
    else
      return self.send(__method__, n/p, fs)
    end
  end
  
  # Returns a hash of prime factors and their counts.
  # Note that the hash returns zero for any factor not known.
  def self.factor_counts(n)
    counts = Hash.new(0)
    return factors(n).inject(counts) {|h,p| counts[p]+=1; h}
  end
  
  # Returns all the primes up to a given value.
  def self.primes_to(n)
    return Eratosthenes.generate_primes(n)
  end
  
  # Returns the first n primes.
  def self.primes(n)
    return Eratosthenes.generate_primes( Helpers.nth_prime_upper_bound(n) )[0,n]
  end
      
end

(1..100).map {|n| [n, Primes.prime?(n)]}