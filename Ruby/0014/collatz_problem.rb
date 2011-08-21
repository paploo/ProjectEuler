# http://projecteuler.net/index.php?section=problems&id=14
# NOTE: I did this before officially joining project Euler, so it doesn't use the Problem class.


#start_t = Time.now

MAX_N = 10**6

# For some reason, Array goes *crazy* on the processor!
# Because without limiting how big the values are we place in the cache,
# we need a 400 GB array when we have 1 million seeds!  But it is a REALLY
# sparse array.  If we limit to only what the array can hold, however, we do better
# than a hash.
SIZE_FACTOR = 1
MAX_CACHE_KEY = MAX_N*SIZE_FACTOR - 1
#STEPS_CACHE = Array.new(MAX_N*SIZE_FACTOR)
#STEPS_CACHE[1]=1
STEPS_CACHE = Math.log2(MAX_N*SIZE_FACTOR).floor.times.to_a.inject([Array.new(MAX_N*SIZE_FACTOR)]) {|a,i| a[2**i]=(i+1); a}

#STEPS_CACHE = Math.log2(MAX_N).floor.times.to_a.inject({}) {|h,i| h[2**i]=(i+1); h}
#STEPS_CACHE = {1=>1}

def steps(seed)
  steps = STEPS_CACHE[seed]
  return steps if steps
  
  new_seed = (seed%2==0) ? (seed>>1) : (3*seed+1)
  
  #return (STEPS_CACHE[seed] = steps(new_seed)+1)
  steps = steps(new_seed)+1
  STEPS_CACHE[seed] = steps if seed <= MAX_CACHE_KEY
  return steps
end

#raise "Got #{steps(1)} instead of 1" unless steps(1) == 1
#raise "Got #{steps(2)} instead of 2" unless steps(2) == 2
#raise "Got #{steps(3)} instead of 8" unless steps(3) == 8
#raise "Got #{steps(13)} instead of 10" unless steps(13) == 10

max_steps = 0
max_seed = 0
n = 1

while(n < MAX_N)
  s = steps(n)
  if s>max_steps
    max_steps = s
    max_seed = n
  end
  
  n += 1
end

#puts Time.now - start_t
#puts STEPS_CACHE.length
#puts STEPS_CACHE.sort[-1].inspect

puts [max_seed, max_steps].inspect