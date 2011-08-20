# This is the base makefile for all problems.
# Make Manual: http://sunsite.ualberta.ca/Documentation/Gnu/make-3.79/html_chapter/make_toc.html

# These are special variables used by the default C file compile rules.
CC = clang
CFLAGS = -Wall -pedantic -std=c99 -O3

# The name of the executable to compile.
EXEC = main.out

# Set any extra search paths
ADDITIONAL_LIBRARY = 
ADDITIONAL_HEADERS = .
ADDITIONAL_LIBRARY_PATH = .

# The helper library
LIBRARY = paplooprojecteuler

# Set the helper library header and paths.
LIBRARY_PATH = ../lib
LIBRARY_HEADERS = ../lib

# Compile the files.
HEADERS = $(wildcard *.h)
SOURCES = $(wildcard *.c)
#HEADERS = foo.h
#SOURCES = main.c foo.c

# Auto build the object list from the source list using a replacement rule.
OBJECTS = $(SOURCES:.c=.o)

# .PHONY hints thtat this is an explicit rule name and to check for the file's existance.
.PHONY : clean all run exec_static exec_dynamic

# Build all object files.
all: $(EXEC)

# Sets the dylib search path at runtime, in case you compiled in a .dylib file
# instead of a .a file.
run: $(EXEC)
	DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$(LIBRARY_PATH):$(ADDITIONAL_LIBRARY_PATH)" time ./$(EXEC)

# Compile the app against the static library.
exec_static: $(OBJECTS)
ifdef ADDITIONAL_LIBRARY
	$(CC) $(OBJECTS) $(LIBRARY_PATH)/lib$(LIBRARY).a -L$(ADDITIONAL_LIBRARY_PATH) -l$(ADDITIONAL_LIBRARY) -o $(EXEC)
else
	$(CC) $(OBJECTS) $(LIBRARY_PATH)/lib$(LIBRARY).a -o $(EXEC)
endif

# Compiles the app.  The linker the .dylib over the .a file, making a dynamic
# link if it can.  The downside to this is that we may need to add a dyld path
# to the env to run.  The run target handles this.
exec_dynamic: $(OBJECTS)
ifdef ADDITIONAL_LIBRARY
	$(CC) $(OBJECTS) -L$(LIBRARY_PATH) -l$(LIBRARY) -L$(ADDITIONAL_LIBRARY_PATH) -l$(ADDITIONAL_LIBRARY) -o $(EXEC)
else
	$(CC) $(OBJECTS) -L$(LIBRARY_PATH) -l$(LIBRARY) -o $(EXEC)
endif

$(EXEC) : exec_static

# Build all C files to object files.
$(OBJECTS) : %.o: %.c
	$(CC) $(CFLAGS) -I$(LIBRARY_HEADERS) -I$(ADDITIONAL_HEADERS) --analyze $<
	$(CC) $(CFLAGS) -I$(LIBRARY_HEADERS) -I$(ADDITIONAL_HEADERS) -c $<
	@echo "    changed files: $?"

# Make all targets have all headers as dependencies.
# For a project of any size it is better to explicitly list.
$(OBJECTS) : $(HEADERS)

# Here is the explicit way:
#
# main.o : main.c
# 	$(CC) $(CFLAGS) -c main.c
# 
# foo.o : foo.c
# 	$(CC) $(CFLAGS) -c foo.c
#
# main.o foo.o : foo.h

# Remove all object files.
clean:
	rm -rf *.o *.plist $(EXEC)