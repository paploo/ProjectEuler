# Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.

require_relative '../lib/problem.rb'

Problem.new do |p|
  
  p.submitted_answer = 5537376230

  p.run do
    numbers_string = File.read("input_strings.txt")
    numbers = numbers_string.split(/\s+/).map {|s| s.to_i}
    sum = numbers.inject(:+)
    #puts sum.inspect
    sum.to_s[0,10].to_i
  end
  
end
