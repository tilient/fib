echo "-- pypy -- python --"
time pypy fib04.py

echo  " "
echo "-- python2 -- python --"
time python2 fib04.py

echo  " "
echo "-- python3 -- python --"
time python3 fib04.py

echo  " "
echo "-- D8/V8 -- javascript --"
time d8 fib04.js

echo " "
echo "-- node.js -- javascript --"
time nodejs fib04.njs

echo " "
echo "-- luajit -- lua"
time luajit fib04.lua

echo " "
gcc -O3 -o fibC fibC.c
echo "-- gcc -- C --"
time ./fibC
rm ./fibC

echo " "
echo "-- rdmd -- D --"
time rdmd fib04.d

echo " "
dmd -O -inline -release -noboundscheck fib04.d
echo "-- dmd -- D --"
time ./fib04
rm ./fib04

echo " "
ldc2 -O5 -boundscheck=off -release -strip-debug fib04.d
echo "-- ldc -- D --"
time ./fib04
rm ./fib04

echo " "
gdc -O3 -o fib04 fib04.d
echo "-- gdc -- D --"
time ./fib04
rm ./fib04

echo " "
scalac fib04.scala
echo "-- scala --"
time scala Fibber
rm Fibber*.class

echo " "
gsc -link fib04_gambc.scm
gcc -o gambit.exe -O3 fib04_gambc*.c -lgambc
echo "-- gambit-c --"
time ./gambit.exe
rm ./gambit.exe
rm ./fib04_gambc*.c

echo " "
echo "-- SBCL --"
time sbcl --script ./fib04.lisp

echo " "
echo "-- CCL --"
time ccl -Q -n -l ./fib04.lisp

echo " "
echo "-- Chicken Scheme --"
csc -static -O5 -C -O3 fib04_chicken.scm
time ./fib04_chicken
rm ./fib04_chicken

echo " "
echo "-- Chicken Scheme (2) --"
chicken fib_and_c04.scm -explicit-use -uses library -optimize-level 5
gcc -static -I./chicken fib_and_c04.c chicken/runtime.c chicken/library.c chicken/build-version.c -O3 -fno-strict-aliasing -fomit-frame-pointer -lm -o fib_and_c
strip fib_and_c
time ./fib_and_c
rm fib_and_c04.c
rm fib_and_c

echo " "
echo "-- go --"
time go run fib04.go

echo " "
echo "-- julia --"
time julia fib04.jl

echo " "
echo "-- clojure --"
time java -Xshare:on -XX:+AggressiveOpts -Xmx8m -Dclojure.compiler.direct-linking=true -cp clojure/clojure-1.8.0.jar clojure.main fib04.clj

echo " "
echo "-- kawa --"
export CLASSPATH=$HOME/bin/kawa/lib/kawa-2.1.1.jar
time java kawa.repl fib_kawa.scm
time kawa fib_kawa.scm

echo " "
echo "-- kawa parallel --"
time kawa pfib_kawa.scm

echo " "
echo "-- haskell --"
ghc fib.hs -O3 -fforce-recomp
time ./fib

echo " "
echo "-- nim --"
nim c -d:release fib.nim
time ./fib

echo " "
echo "-- ada --"
gnatmake -O3 -fomit-frame-pointer -gnatNp fib.adb
time ./fib

echo " "
echo "-- chapel --"
source util/quickstart/setchplenv.bash
chpl --fast -o fib fib.chpl
time ./fib

echo " "
echo "-- rust --"
rustc -O fib.rs
time ./fib

echo " "
echo "-- sisal --"
sisalc -v -no-bounds CFLAGS=-O3 fib.sis -o fib
time ./fib

echo " "
echo "-- pony --"
ponyc pony -o pony1
time ./pony1

echo " "
echo "-- f# --"
fsharpc -O  -o fib.exe fib.ml
time ./fib.exe

echo " "
echo "-- kotlin --"
kotlinc fib.kt -include-runtime -d kotlinfib.jar
time java -jar kotlinfib.jar
time avian -jar kotlinfib.jar
rm kotlinfib.jar

echo " "
echo "-- kotlin script --"
time ./fib.kts

echo " "
echo "-- kotlin native --"
konanc -opt fib.kt -o fib
time ./fib.kexe
rm fib.kexe

echo " "
echo "-- kotlin parallel 2 --"
kotlinc -cp kotlinx-coroutines-core.jar p2fib.kt -include-runtime -d tmp.jar
zipmerge kotlinp2fib.jar kotlinx-coroutines-core.jar tmp.jar
rm tmp.jar
time java -jar kotlinp2fib.jar
rm kotlinp2fib.jar

echo " "
echo "-- erlang --"
erlc +native fib.erl
time erl -noshell -s fib start -s init stop

echo " "
echo "-- ocaml --"
ocamlopt -o fib -ccopt -O3 fib.ml
time ./fib

echo " "
echo "-- frege --"
java -jar frege3.jar -target 1.7 -O Fibber.fr
time java -Xshare:on -XX:+AggressiveOpts -Xmx8m -cp frege3.jar:. Fibber

echo " "
echo "-- yeti --"
time java -jar yeti.jar fib.yeti

echo " "
echo "-- racket --"
time racket fib04_racket.scm

echo " "
echo "-- ceylon--"
ceylon compile source/fib.ceylon
time ceylon run default

echo " "
echo "-- swift --"
swiftc -O fib.swift
time ./fib

echo " "
echo "-- ocamljava --"
ocamljava -o fibber.jar fib.ml
time java -jar fibber.jar

echo " "
echo "-- eta haskell --"
eta fib.hs
time java  -Xshare:on -jar Runfib.jar

echo " "
echo "-- cling --"
time cling fibCling.c

echo " "
echo "-- free pascal --"
fpc fib04.pas -O3
time ./fib04


echo " "
echo "-- C# --"
mcs fib.cs
time mono fib.exe
