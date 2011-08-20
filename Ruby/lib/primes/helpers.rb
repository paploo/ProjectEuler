module Primes
  module Helpers
    # Prime[2^#] & /@ Table[k, {k, 0, 32}]
    NTH_PRIMES_EXP_2 = [2, 3, 7, 19, 53, 131, 311, 719, 1619, 3671, 8161, 17863, 38873, 84017, 180503, 386093, 821641, 1742537, 3681131, 7754077, 16290047, 34136029, 71378569, 148948139, 310248241, 645155197, 1339484197, 2777105129, 5750079047, 11891268401, 24563311309, 50685770167, 104484802057]
    
    # PrimePi[2^#] & /@ Table[k, {k, 0, 32}]
    PRIME_PIS_EXP_2 = [0, 1, 2, 4, 6, 11, 18, 31, 54, 97, 172, 309, 564, 1028, 1900, 3512, 6542, 12251, 23000, 43390, 82025, 155611, 295947, 564163, 1077871, 2063689, 3957809, 7603553, 14630843, 28192750, 54400028, 105097565, 203280221]
    
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
    
    # Returns 0 if it is suspected to be prime but may be composite.
    # Returns -1 if it is composite for sure.
    #
    # PGP and RSA usually use the fermat test, where you try various random
    # integers in the range [1,n-1] against the quantity (a**(n-1)) % n and
    # see if it ever is not equal to 1.  This can find false positives.
    #
    # Here we check the test k times against n with random a.  If, when we start
    # the loop, timout seconds has elapsed, then we break and return true.
    def self.fermat_test_prime?(n,k,timeout=nil)
      start_t = Time.now
      a = 0
      k.times do |i|
        return IS_UNDETERMINED if timeout && (Time.now-start_t)>=timeout && i.nonzero?
        a = rand(n-1)+1
        return IS_COMPOSITE if mod_pow(a,n-1,n) != 1
      end
      return IS_UNDETERMINED
    end
    
  end
end