# These are special variables used by the default C file compile rules.
CC = clang
CFLAGS = -Wall -pedantic -std=c99 -O3

# Any additional headers
ADDITIONAL_HEADERS = .

# The name of the library to compile.
LIB = paplooprojecteuler
DYLIB = lib$(LIB).dylib
ARLIB = lib$(LIB).a

# Compile the files.
HEADERS = $(wildcard *.h)
SOURCES = $(wildcard *.c)
#HEADERS = foo.h
#SOURCES = main.c foo.c

# Auto build the object list from the source list using a replacement rule.
OBJECTS = $(SOURCES:.c=.o)

# .PHONY hints thtat this is an explicit rule name and to check for the file's existance.
.PHONY : clean all staticlib dynamic lib

# Build all object files and compile into its libs.
all: staticlib dynamiclib

staticlib: $(ARLIB)

dynamiclib: $(DYLIB)

# Creats a static library archive (.a) file, that can be compiled in statically.
$(ARLIB): $(OBJECTS)
	 ar rcs $(ARLIB) $(OBJECTS)

# Creats a dynmic library (.dylib) file, that must either be installed in a
# standard search path (/usr/local/lib) or referred to in DYLD_LIBRARY_PATH
$(DYLIB): $(OBJECTS)
	$(CC) $(OBJECTS) -shared -v  -o $(DYLIB)

# Build all C files to object files.
$(OBJECTS) : %.o: %.c
	$(CC) $(CFLAGS) -I$(ADDITIONAL_HEADERS) --analyze $<
	$(CC) $(CFLAGS) -I$(ADDITIONAL_HEADERS) -c $<
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
	rm -rf *.o *.plist $(ARLIB) $(DYLIB)