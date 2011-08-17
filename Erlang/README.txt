To run any o these projects:

1. Make sure lib is up-to-date:
    $ cd Erlang/lib
    $ erlc *.erl
    
2. Compile the problem files:
    $ cd Erlang/0001
    $ erlc *.erl

3. Open-up erl and run:
    $ erl
    > main:start().

One can recompile and refresh the main easily using
    > c(main).
    
If you do this with "../lib/problem", for example, it'll make and a local beam
file instead of recompiling the one there.