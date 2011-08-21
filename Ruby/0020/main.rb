# n! means n  (n  1)  ...  3  2  1
# 
# For example, 10! = 10  9  ...  3  2  1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
# 
# Find the sum of the digits in the number 100!

require_relative '../lib/problem.rb'
require_relative '../lib/extensions.rb'

def sum_digits(n)
  n.to_digits.inject(:+)
end

Problem.new do |p|
  p.check(27) { sum_digits( (1..10).inject(:*) ) }

  p.submitted_answer = 648
  p.run { sum_digits( (1..100).inject(:*) ) }
end