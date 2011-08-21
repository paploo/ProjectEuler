- module(problem).
- export([check/2, run/1, run/2]).

check(Answer, Fun) ->
	ComputedAnswer = Fun(),
	output_check(ComputedAnswer, Answer),
	case ComputedAnswer =:= Answer of
		false ->
			throw(check_failed);
		true ->
			true
	end.

run(Fun) ->
	Start = now(),
	ComputedAnswer = Fun(),
	Stop = now(),
	io:format("-- Computed in ~w ms~n", [deltaT(Start, Stop)*1000.0]),
	io:format("ANSWER: ~w~n", [ComputedAnswer]),
	ComputedAnswer.
	
run(SubmittedAnswer, Fun) ->
	Start = now(),
	ComputedAnswer = Fun(),
	Stop = now(),
	output_check(ComputedAnswer, SubmittedAnswer),
	io:format("-- Computed in ~w ms~n", [deltaT(Start, Stop)*1000.0]),
	io:format("ANSWER: ~w~n", [ComputedAnswer]),
	ComputedAnswer.

% Note that we use =:= which won't compare integers with floats.  It is up to you
% to be consistent about returning integers or floats, depending on the problem!
output_check(ComputedAnswer, RightAnswer) ->
	io:format("-- Answer Correct: ~w, Expected: ~w, Got: ~w~n", [(RightAnswer =:= ComputedAnswer), RightAnswer, ComputedAnswer]).
	
deltaT({Start_mega, Start_sec, Start_micro}, {Stop_mega, Stop_sec, Stop_micro}) ->
  Delta_mega = Stop_mega - Start_mega,
  Delta_sec = Stop_sec - Start_sec,
  Delta_micro = Stop_micro - Start_micro,
  (Delta_mega*1000000) + (Delta_sec) + (Delta_micro/1000000).