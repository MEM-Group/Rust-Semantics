

kompiled: clang-kompiled srust-kompiled

clang-kompiled: cl-src/*.k
	../k/bin/kompile cl-src/clang.k --backend java

srust-kompiled: rust-src/*.k rust-src/clang_op/*.k rust-src/lib/*.k
	../k/bin/kompile rust-src/srust.k --backend java


clean:
	rm -f -r *~ cl-src/*~ rust-src/*~ rust_tests/rv/*/*~

cleanall: clean
	rm -f -r cl-src/clang-kompiled rust-src/srust-kompiled
