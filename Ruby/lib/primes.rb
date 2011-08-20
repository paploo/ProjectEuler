require_relative 'primes/eratosthenes'

module Primes
  # Prime[2^#] & /@ Table[k, {k, 0, 32}]
  NTH_PRIMES_EXP_2 = [2, 3, 7, 19, 53, 131, 311, 719, 1619, 3671, 8161, 17863, 38873, 84017, 180503, 386093, 821641, 1742537, 3681131, 7754077, 16290047, 34136029, 71378569, 148948139, 310248241, 645155197, 1339484197, 2777105129, 5750079047, 11891268401, 24563311309, 50685770167, 104484802057]
  
  # PrimePi[2^#] & /@ Table[k, {k, 0, 32}]
  PRIME_PIS_EXP_2 = [0, 1, 2, 4, 6, 11, 18, 31, 54, 97, 172, 309, 564, 1028, 1900, 3512, 6542, 12251, 23000, 43390, 82025, 155611, 295947, 564163, 1077871, 2063689, 3957809, 7603553, 14630843, 28192750, 54400028, 105097565, 203280221]
  
  # Returns true if the prime is true.
  def self.prime?(n)
    # To deal with 1 is a special case, and we grab anything negative while we're at it.
    return false if n<2
    
    # Then we see if the first prime factor is not itse self.
    return first_prime_factor(n) == n
  end
  
  # Returns the first found prime factor, or n if it is prime.
  def self.first_prime_factor(n)
    # First check if it is prime using the fast_prime_filter.
    return n if fast_prime_test(n)==1
    
    # get the list of necessary primes and try to factor it.
    primes = primes_to(Math.sqrt(n) + 1) # To be safe against rounding errors, we do (sqrt(n)+1).floor.  One extra test won't hurt.
    first_p = primes.find {|p| n%p==0}
    return first_p.nil? ? n : first_p
  end
  
  # Uses fast prime test algorithms.  Returns 1 if it is verifiably prime,
  # -1 if it is verifiably composite, and 0 if it is inconclusive.
  def self.fast_prime_test(n)
    return 0
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
  
  module Helpers
    
    # This returns a number guaranteed to be more than the nth prime.
    def self.nth_prime_upper_bound(n)
      exponent = Math.log(n, 2).ceil
      return NTH_PRIMES_EXP_2[exponent]
    end
    
    
    # This returns a number guaranteed to be higher than the actual number of
    # primes at or lower than the given number
    def self.prime_pi_upper_bound(n)
      exponent = Math.log(n, 2).ceil
      return PRIME_PIS_EXP_2[exponent]
    end
    
  end
  
end