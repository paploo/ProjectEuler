#2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
#What is the sum of the digits of the number 2^1000?

require_relative '../lib/problem.rb'
require_relative '../lib/extensions.rb'

def sum_digits(n)
  n.to_digits.inject(:+)
end

Problem.new do |p|
  p.check(26) { sum_digits(2**15) }

  p.submitted_answer = 1366
  p.run { sum_digits(2**1000) }
end