% The sum of the squares of the first ten natural numbers is,
% 
% 1^2 + 2^2 + ... + 10^2 = 385
% The square of the sum of the first ten natural numbers is,
% 
% (1 + 2 + ... + 10)^2 = 552 = 3025
% Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
% 
% Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

- module(main).
- export([start/0]).

start() ->
	code:add_patha("../lib"),
	problem:check(2640, fun() -> diff(10) end),
	problem:run(25164150, fun() -> diff(100) end).
	
diff(N) ->
	L = lists:seq(1,N),
	SumOfSquares = lists:sum( lists:map(fun(X) -> X*X end, L) ),
	N = length(L),
	Sum = round(N*(N+1)/2), % This is always an integer, so the round is just to force it to be an int and not a float.
	Sum*Sum - SumOfSquares.