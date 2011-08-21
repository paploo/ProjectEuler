% There exists exactly one Pythagorean triplet for which a + b + c = 1000.
% Find the product abc.

- module(main).
- export([start/0]).
- compile(export_all).

start() ->
	code:add_patha("../lib"),
	problem:check(3*4*5, fun() -> solve(3+4+5) end),
	problem:run(31875000, fun() -> solve(1000) end).

% We get the list of all matches, find their products, but only return the first one found.
solve(N) ->
	Pyth = pythag(N),
	Prods = products(Pyth),
	head(Prods).

products(L) ->
	[A*B*C || {A,B,C}<-L].

head([]) ->
	nil;
head([H|_]) ->
	H.

pythag(N) ->
	[{A,B,C} ||
		A <- lists:seq(1,N-2),
		B <- lists:seq(A+1,N-1),
		C <- lists:seq(B+1,N),
		A+B+C =:= N,
		A*A + B*B == C*C
	].
