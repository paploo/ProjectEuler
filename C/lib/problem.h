#include <stdint.h>
#include <inttypes.h>
#include <stdbool.h>

#include "definitions.h"

/* Define special integer types */
typedef Integer ProblemInteger;
typedef UInteger ProblemUInteger;

/* Define printf macros for these */
#define PRIPI PRId64
#define PRIPUI PRIu64

/* Define function pointers for problem procedures */
typedef ProblemInteger(ProblemIntegerProcedure)(void);
typedef ProblemInteger(ProblemUIntegerProcedure)(void);

/* Define the check methods */
bool ProblemIntegerCheck(ProblemInteger answer, ProblemIntegerProcedure *fp);
bool ProblemUIntegerCheck(ProblemUInteger answer, ProblemUIntegerProcedure *fp);

/* Define the run methods */
ProblemInteger ProblemIntegerRun(ProblemInteger submittedAnswer, bool hasSubmittedAnswer, ProblemIntegerProcedure *fp);
ProblemUInteger ProblemUIntegerRun(ProblemUInteger submittedAnswer, bool hasSubmittedAnswer, ProblemUIntegerProcedure *fp);
