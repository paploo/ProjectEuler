# The sum of the squares of the first ten natural numbers is,
# 
# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
# 
# (1 + 2 + ... + 10)^2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
# 
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

require_relative '../lib/problem.rb'

def diff(n)
  sum_of_squares = (1..n).inject(0) {|s,a| s + a**2}
  sum = (1..n).inject(:+)
  return sum**2 - sum_of_squares
end

Problem.new do |p|
  
  p.check(2640) { diff(10) }
  
  p.submitted_answer = 25164150
  p.run { diff(100) }
  
end