# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

require_relative '../lib/problem.rb'

Problem.new do |p|

  #p.submitted_answer = "2783915604"
  #p.submitted_answer = "2783915640"

  p.check("120") {[0,1,2].permutation.to_a[4-1].join}
  
  p.run do
    [0,1,2,3,4,5,6,7,8,9].permutation.to_a[1000000-1].join
  end
  
end
