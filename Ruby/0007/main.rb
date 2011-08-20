# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#
# What is the 10001st prime number?

require_relative '../lib/problem.rb'
require_relative '../lib/primes.rb'

# We inefficiently overdo how many primes we need and then the right one
# from the list.  A better implementation would calculate primes until we need
# them, or at least use the prime counting function to guess at the number of
# primes we need to calculate.
def nth_prime(n)
  return Primes.primes(n)[-1]
end

Problem.new do |p|
  
  p.check(13) { nth_prime(6) }
  
  p.submitted_answer = 104743
  p.run { nth_prime(10001) }
  
end