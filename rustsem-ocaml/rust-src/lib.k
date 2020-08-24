
/*@

This library is for our own use

*/



module LIB-SYNTAX

imports DOMAINS

/*@

	In the modeling, we sometimes want to deal with the following conditions:
	we have two tasks: T1 and T2.
	we want:
	   1) T1 is computed before T2
	   2) T1 has a result, i.e. it is not reduced to empty.
	   3) we want to T2 to execute then but the result of T1 is always T1.

*/

syntax AuxItems
       ::= KItem "@->" KItem		[strict(1)]

endmodule

module LIB

imports LIB-SYNTAX
imports DOMAINS

syntax KResult

rule V:KResult @-> T:KItem => T ~> V

endmodule