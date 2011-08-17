#If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#Find the sum of all the multiples of 3 or 5 below 1000.

# This is the meat of the solution.
# This is the most straight-forward solution, but not the most efficient.
def sum(n)
  (1...n).select {|a| a%3==0 || a%5==0}.inject(:+)
end

# This is all just output.
s = sum(10)
if( s == 23 )
  answer = sum(1000)
  puts answer
  submitted_answer = 233168
  puts "Equals Submitted Answer!" if answer == submitted_answer
else
  puts "Expected 23 but got #{s.inspect}"
end