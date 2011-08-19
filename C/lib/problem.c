#include <stdio.h>
#include <time.h>

#include "problem.h"

/* Declare Private Functions */
void ProblemOutputIntegerCheck(ProblemInteger computedAnswer, ProblemInteger rightAnswer);
void ProblemOutputUIntegerCheck(ProblemUInteger computedAnswer, ProblemUInteger rightAnswer);

/********** INTEGER FUNCTIONS **********/

/* Do a check */
bool ProblemIntegerCheck(ProblemInteger answer, ProblemIntegerProcedure *fp) {
	ProblemInteger computedAnswer = (*fp)();
	ProblemOutputIntegerCheck(computedAnswer, answer);
	return computedAnswer == answer;
}

/* Run a Problem */
ProblemInteger ProblemIntegerRun(ProblemInteger submittedAnswer, bool hasSubmittedAnswer, ProblemIntegerProcedure *fp) {
	clock_t startAt = clock();
	ProblemInteger computedAnswer = (*fp)();
	clock_t stopAt = clock();
	double deltaT = (double)(stopAt - startAt) / CLOCKS_PER_SEC;
	if( hasSubmittedAnswer )
		ProblemOutputIntegerCheck(computedAnswer, submittedAnswer);
	printf("-- Computed in %f ms\n", deltaT*1000.0);
	printf("ANSWER: %" PRIPI "\n", computedAnswer);
	return computedAnswer;
}

/* Private function for outputting the check results. */
void ProblemOutputIntegerCheck(ProblemInteger computedAnswer, ProblemInteger rightAnswer) {
	printf("-- Answer Correct: %s, Expected: %" PRIPI ", Got: %" PRIPI "\n", computedAnswer==rightAnswer ? "YES" : "NO", computedAnswer, rightAnswer);
}

/********** UINTEGER FUNCTIONS **********/

/* Do a check */
bool ProblemUIntegerCheck(ProblemUInteger answer, ProblemUIntegerProcedure *fp) {
	ProblemUInteger computedAnswer = (*fp)();
	ProblemOutputUIntegerCheck(computedAnswer, answer);
	return computedAnswer == answer;
}

/* Run a Problem */
ProblemUInteger ProblemUIntegerRun(ProblemUInteger submittedAnswer, bool hasSubmittedAnswer, ProblemUIntegerProcedure *fp) {
	clock_t startAt = clock();
	ProblemUInteger computedAnswer = (*fp)();
	clock_t stopAt = clock();
	double deltaT = (double)(stopAt - startAt) / CLOCKS_PER_SEC;
	if( hasSubmittedAnswer )
		ProblemOutputUIntegerCheck(computedAnswer, submittedAnswer);
	printf("-- Computed in %f ms\n", deltaT*1000.0);
	printf("ANSWER: %" PRIPUI "\n", computedAnswer);
	return computedAnswer;
}

/* Private function for outputting the check results. */
void ProblemOutputUIntegerCheck(ProblemUInteger computedAnswer, ProblemUInteger rightAnswer) {
	printf("-- Answer Correct: %s, Expected: %" PRIPUI ", Got: %" PRIPUI "\n", computedAnswer==rightAnswer ? "YES" : "NO", computedAnswer, rightAnswer);
}
