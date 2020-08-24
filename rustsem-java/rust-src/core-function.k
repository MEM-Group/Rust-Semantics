
require "configuration.k"
require "srust-syntax.k"
require "tydef.k"

module CORE-FUNCTION

imports CONFIGURATION
imports SRUST-SYNTAX
imports TYDEF
imports CLANG-SYNTAX


syntax Int
       ::= getVarId(Exp)		[function]
         | getVarIndex(Exp)		[function]
	 | getRootId(VarId)		[function]

syntax Int
       ::= minSet(Set)		[function]
	 | minSet1(K,K)		[function]


rule getVarId(V:VarId) => getVarIndex(V)
rule getVarId(* V:Exp) => getVarId(V)
rule getVarId(& M:Mut V:Exp) => getVarId(V)
rule getVarId(V:Exp.J:Int) => getVarId(V)


rule getVarIndex(var(I:Int)) => I
rule getVarIndex(cvar(V:VarId,J:Int)) => getVarIndex(V) 
rule getVarIndex(* V:Exp) => getVarIndex(V)
rule getVarIndex(& M:Mut V:Exp) => getVarIndex(V)
rule getVarIndex(V:Exp.J:Int) => getVarIndex(V)


/*******************************************************@
	Move Checking and Borrow Checking
********************************************************/
/*
syntax KItem
       ::= canMove(Exp)

rule <k> canMove(expTy( R:Exp,ref(_,_,_),_,_)) => . ... </k>

rule canMove(expTy( R:Exp, i32, _, _)) => .
rule canMove(expTy( R:Exp, bool, _ ,_)) => .

rule canMove(expTy(R:Exp,T:RType,_,_)) => .

rule canMove(expTy(var(_), T:RType, _ , _)) => .
rule canMove(expTy(cvar(_,_), T:RType, _,_ )) => .

*/

rule getRootId(var(I:Int)) => I

rule getRootId(cvar(V:VarId,I)) => getRootId(V)

rule minSet(.Set) => -1

rule minSet(SetItem(V:VarId)) => getRootId(V)

rule minSet(SetItem(V:VarId) S:Set) => minSet1(getRootId(V),minSet(S))

rule minSet1(I:Int,-1) => I

rule minSet1(I:Int,J:Int) => minInt(I,J)
     requires J =/=Int -1


syntax Int
       ::= minLft(Int,Int)		[function]

rule minLft(-1,L:Int) => L

rule minLft(L:Int,-1) => L
when L =/=Int -1

rule minLft(L1:Int,L2:Int) => minInt(L1,L2)
when (L1 =/=Int -1) andBool (L2 =/=Int -1)




endmodule