I'm re-doing many of the problems in Erlang to get a better grasp of how to use it.


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
And don't forget that to exit the shell you run
    > halt.
    
If you do this with "../lib/problem", for example, it'll make and a local beam
file instead of recompiling the one there.

Note that if you want to one-off run, you can just run:

$ erl -noshell -s main start -s init stop