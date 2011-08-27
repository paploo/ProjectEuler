# What is the first term in the Fibonacci sequence to contain 1000 digits?

require_relative '../lib/problem.rb'

def fib_until_len(len)
  a = 1
  b = 1
  c = a+b

  n = 2

  while(c.to_s.length < len)
    c = a+b
    
    a = b
    b = c
    n+=1
  end
  
  return n
end

Problem.new do |p|

  p.check(12) { fib_until_len(3) }

  p.submitted_answer = 4782
  p.run { fib_until_len(1000) }
  
end

