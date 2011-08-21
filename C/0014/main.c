/* 
  http://projecteuler.net/index.php?section=problems&id=14
  I did this in ruby and it took 1.01 seconds to run when MAX_N = 1 million.
  It ran in 0.02 seconds in gcc -03, and 0.03 in clang.

  NOTE: This was written before I officially started doing Project Euler, so it
  doesn't use my problem framework.
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdint.h>

#define MAX_N 1000000
#define CACHE_SIZE (1*MAX_N)

typedef uint32_t UInteger;

void run();
void initStepsCache();

static UInteger steps(UInteger seed);

#define __DYNAMIC_CACHE_ALLOC__

#ifdef __DYNAMIC_CACHE_ALLOC__
static UInteger *g_stepsCache;
#else
static UInteger g_stepsCache[CACHE_SIZE];
#endif

int main() {
  clock_t startTicks = clock();
  
  run();
  
  clock_t endTicks = clock();
  clock_t deltaTicks = endTicks - startTicks;
  double runTime = (double)deltaTicks / CLOCKS_PER_SEC;
  printf("Runtime: %f sec\n", runTime);
  
  return 0;
}

void run() {
  initStepsCache();
  
  UInteger maxSteps = 0;
  UInteger maxSeed = 0;
  UInteger n = 1;
  UInteger s = 0;
  
  while(n < MAX_N) {
    s = steps(n);
    if(s > maxSteps) {
      maxSteps = s;
      maxSeed = n;
    }
    
    n++;
  }
  
  printf("maxSeed: %u, maxSteps: %u\n", maxSeed, maxSteps);
  
  #ifdef __DYNAMIC_CACHE_ALLOC__
  free(g_stepsCache);
  #endif
}

void initStepsCache() {
  #ifdef __DYNAMIC_CACHE_ALLOC__
  g_stepsCache = calloc(CACHE_SIZE, sizeof(UInteger)); /* Calloc also initializes elements to zero, while malloc doesn't.*/
  #endif
  
  UInteger seed = 1;
  UInteger steps = 1;
  while( seed < CACHE_SIZE )
  {
    g_stepsCache[seed] = steps;
    seed = seed << 1;
    steps++;
  }
}

UInteger steps(UInteger seed) {
  UInteger s = 0;
  if( seed < CACHE_SIZE ) {
    s = g_stepsCache[seed];
    if( s > 0 )
      return s;
  }
  
  UInteger newSeed = (seed%2==0) ? (seed>>1) : (3*seed+1);
  
  s = steps(newSeed) + 1;
  if( seed < CACHE_SIZE )
    g_stepsCache[seed] = s;
  return s;
}
