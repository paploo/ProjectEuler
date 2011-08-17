#If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#Find the sum of all the multiples of 3 or 5 below 1000.

require_relative '../lib/problem.rb'

def sum(n)
  (1...n).select {|a| a%3==0 || a%5==0}.inject(:+)
end

Problem.new do |p|
  
  p.check(23) { sum(10) }
  
  p.submitted_answer = 233168
  p.run { sum(100) }
  
end