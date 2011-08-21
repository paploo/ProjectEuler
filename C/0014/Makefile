all: clang gcc

run: run-all

run-all: run-clang run-gcc

run-gcc: gcc
	./collatz-gcc.out

run-clang: clang
	./collatz-clang.out

gcc:
	gcc -O3 -o collatz-gcc.out main.c

clang:
	clang --analyze main.c
	clang -O3 -o collatz-clang.out main.c
	#clang -O4 -ansi --pedantic -o collatz-clang main.c

clean:
	rm -rf collatz-clang.out collatz-gcc.out