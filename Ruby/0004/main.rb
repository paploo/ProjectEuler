# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.

require_relative '../lib/problem.rb'
require_relative '../lib/primes.rb'

# No need to do more than the straight-forward brute force solution today.
def palindrome(n)
  largest = 0
  
  (1..n).to_a.reverse.each do |i|
    (1..n).to_a.reverse.each do |j|
      k = i*j
      largest = k if k>largest && k.to_s==k.to_s.reverse
    end 
  end
  
  return largest
end

Problem.new do |p|
  
  
  p.check(9009) { palindrome(99) }
  
  p.submitted_answer = 906609
  p.run { palindrome(999) }
  
end