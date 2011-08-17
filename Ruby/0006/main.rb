# The sum of the squares of the first ten natural numbers is,
# 
# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
# 
# (1 + 2 + ... + 10)^2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
# 
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

def diff(n)
  sum_of_squares = (1..n).inject(0) {|s,a| s + a**2}
  sum = (1..n).inject(:+)
  return sum**2 - sum_of_squares
end

# Test value:
test_value = diff(10)
test_ans = 2640
puts [:test_value, test_value, :test_ans, test_ans, :==, test_value==test_ans].inspect

# Result
value = diff(100)
puts value.inspect

puts 25164150 # Submitted Answer