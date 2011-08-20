#The prime factors of 13195 are 5, 7, 13 and 29.
#
#What is the largest prime factor of the number 600851475143 ?

require_relative '../lib/problem.rb'
require_relative '../lib/primes.rb'

def largest_prime(n)
  factors = Primes.factors(n)
  puts factors.inspect
  return factors[-1]
end

Problem.new do |p|
  
  p.check(29) { largest_prime(13195) }
  
  p.submitted_answer = 6857
  p.run { largest_prime(600851475143) }
  
end