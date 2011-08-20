#2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?


require_relative '../lib/problem.rb'
require_relative '../lib/primes.rb'

def solve(n)
  # First, we get the prime factor counts for each integer 2 through n.
  # Next, for each seen prime factor, we get the maximum count seen.
  # Finally, we multiply them all out to get the answer.
  # NOTE: We do Hash.new(0) so that a missing factor returns a zero count.
  counts = (2..n).map {|x| Primes.factor_counts(x)}.inject do |a,b|
    (a.keys | b.keys).inject(Hash.new(0)) {|h,k| h[k] = [a[k],b[k]].max; h}
  end
  return counts.inject(1) {|s,(k,v)| s * k**v}
end

Problem.new do |p|
  
  p.check(2520) { solve(10) }
  
  p.submitted_answer = 232792560 
  p.run { solve(20) }
  
end