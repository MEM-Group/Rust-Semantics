
require "srust-syntax.k"
require "tydef.k"

module SORTINDEX

imports SRUST-SYNTAX
imports TYDEF

syntax Int
       ::= sortIndex(K)	[function]



/***********For type index*************/


rule sortIndex(i32) => 1
rule sortIndex(bool) => 2
rule sortIndex(f32) => 1

rule sortIndex(#owner(_)) => 3
rule sortIndex(#ref(_)) => 4
rule sortIndex(T:FnTy) => 5
rule sortIndex(#sum(_)) => 6
rule sortIndex(#prod(_)) => 7
rule sortIndex(#void) => 8
//rule sortIndex(#ty(_:Ident)) => 9
rule sortIndex(#array(_,_)) => 10
rule sortIndex(str) => 11

rule sortIndex(_:Int) => 11
rule sortIndex(_:Bool) => 11
rule sortIndex(_:String) => 11
//rule sortIndex(_:Ident) => 11
rule sortIndex(_:Exp._:Exp) => 11
rule sortIndex(var(_:Int)) => 15
rule sortIndex(cvar(_:Exp,_:Int)) => 15
rule sortIndex(* E:Exp) => 16
rule sortIndex(#trait(_)) => 17
rule sortIndex(#tyself)    =>   18
rule sortIndex([_:CoreTy; _:Int]) => 19
rule sortIndex(#raw(T:CoreTy)) => 20
//rule sortIndex(#sumId(T)) => 21
//rule sortIndex(#prodId(T)) => 22
rule sortIndex(#ty(_:Ident)) => 23
rule sortIndex(#TyUndef) => 24
rule sortIndex(#IdTy(_,_)) => 27
rule sortIndex(#RIndex(_,_)) => 28

rule sortIndex(#vec(_)) => 25
rule sortIndex(#closureTy(_:Ident,_:FnTy)) => 26
//rule sortIndex(Box<_:RSType>) => 3
//rule sortIndex(Box<_:Ident>) => 3



rule #RStoCT(X:Ident, M:Map) => #owner(#unwrapCoreTy(M[X]))
     requires (X in keys(M)) andBool (sortIndex(M[X]) =/=Int 17)

rule #RStoCT(X:Ident, M:Map) => #unwrapCoreTy(M[X])
     requires (X in keys(M)) andBool (sortIndex(M[X]) ==Int 17)


endmodule


