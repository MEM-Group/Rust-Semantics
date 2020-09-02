A Semantics for Rust


We have two folders:

rustsem-ocaml
rustsem-java.
Both of them have the same semantics rules. K-Framework has two backends: Java backend and Ocaml backend.

Ocaml backend provides efficient execution engine that is useful for testing and runtime verification.

Java backend provides deductive verification engine.

In order to run RustSEM. K-Framework needs to be installed. The version of K-Framework that we used is K-Framework for RustSEM We are not sure that previous or later versions of K-Framework are compatible with this version. Details of installing and using K-Framework can be found: K-Framework

Testing and Runtime Verification
In order to run rustsem-ocaml, we need firstly compile the semantics with the following command:

kompile srust.k --backend ocaml

More details can be found at Testing and Runtime Verification

Deductive Verification
In order to run rustsem-ocaml, we need firstly compile the semantics with the following command:

kompile srust.k --backend java

More details can found at Deductive Verification
