# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
#
# Additionally, I am given that 1 Jan 1900 was a Monday, which makes the 7th a Sunday.

require 'date'

require_relative '../lib/problem.rb'

Problem.new do |p|
  
  p.submitted_answer = 173
  
  p.run do
    # We start on a Sunday so we can test every 7th day.
    start_date = Date.new(1899,12,31)

    century_start_date = Date.new(1901,1,1)
    century_stop_date = Date.new(2000,12,31)
    
    d = century_start_date
    n = 0
    while(d <= century_stop_date)
      n+=1 if d.day == 1 && (1901..2000).include?(d.year)
      d += 7
    end

    puts n
  end
  
end
