
kompiled: env srust-kompiled clang-kompiled

env:
	eval `opam config env`

srust-kompiled: rust-src/*.k rust-src/clang_op/*.k rust-src/lib/*.k
	../k/bin/kompile rust-src/srust.k --backend ocaml 

clang-kompiled: cl-src/*.k
	../k/bin/kompile cl-src/clang.k --backend ocaml 

cleanall:
	rm -f -r *~ cl-src/*~ rust-src/*~ rust-src/clang_op/*~ cl-src/clang-kompiled rust-src/srust-kompiled

clean:
	rm -f -r *~ cl-src/*~ rust-src/*~ 



