require "tydef.k"
require "srust-syntax.k"
require "configuration.k"
require "llifetime.k"

module COMPTY

imports DOMAINS-SYNTAX
imports TYDEF
imports SRUST-SYNTAX
imports CONFIGURATION
imports LLIFETIME

syntax TypeItem
       ::= #buildCType(Int,Int, CoreTys)
         | #tyBind(K,K)


/*

rule <k> X:Ident :=: prodTy(RTs:RTypes) => #buildCType(C,0,RTs) ~> #tyBind(#prodId(X),C) ... </k>
     <ctyCnt> C:Int => C +Int 1 </ctyCnt>
     <id2type> .Map => X |-> #prodId(X) ... </id2type>
     (.Bag =>
       <comtype>
	 <ctyId> C </ctyId>
	 <ctyKind> 0 </ctyKind>
	 <ctyElem> .Map </ctyElem>
	 <cntElem> 0 </cntElem>
       </comtype> )


rule <k> X:Ident :=: sumTy(RTs:RTypes) => #buildCType(C,0,RTs) ~> #tyBind(#sumId(X),C) ... </k>
     <ctyCnt> C:Int => C +Int 1 </ctyCnt>
     <id2type> .Map => X |-> #sumId(X) ... </id2type>
     (.Bag =>
       <comtype>
	 <ctyId> C </ctyId>
	 <ctyKind> 1 </ctyKind>
	 <ctyElem> .Map </ctyElem>
	 <cntElem> 0 </cntElem>
       </comtype>)

rule <k> #buildCType(C:Int,I:Int,(T:RType, RestT:RTypes)) => 
     				      #buildCType(C,I +Int 1, RestT) ... </k>
     <ctyId> C </ctyId>
     <ctyElem> (.Map => I |-> T) ... </ctyElem>
     
rule <k> #buildCType(C:Int,N:Int,.RTypes) => . ... </k>
     <ctyId> C </ctyId>
     <cntElem> 0 => N -Int 1 </cntElem>
*/      

rule <k> #tyBind(X:KItem,C:KItem) => . ... </k>
     <typeCtx> (.Map => X |-> C) Rho:Map  </typeCtx>
     requires notBool (X in keys(Rho))

rule X :=: T:CoreTy => #tyBind(X,T) 
     

endmodule
