
require "srust-syntax.k"
require "configuration.k"

module LLIFETIME

imports SRUST-SYNTAX
imports CONFIGURATION

/*@************************************************************
			For lifetime
**************************************************************/



syntax TyCKItem
       ::= #removeLifetime1(Int,Map,Map,Set)				[klabel(rmlft1)]
	 | #removeLifetime2(Int,Map,K,K,Map,Set)				[klabel(rmlft2)]

syntax Int
       ::= cam(Int,Int)	[function]
     
syntax Map
       ::= removeVarbyLft(Int,Map)					[function]

rule cam(L,L1) => -1
     when L ==Int L1

rule cam(L,L1) => L1
     when L=/=Int L1


rule <k> #newlft => . ... </k>
     <currentLft> C:Int => C +Int 1 </currentLft>
     <stackEnv> .List => ListItem(Rho) ...  </stackEnv>
     <tcenv> Rho:Map </tcenv>

rule <k> #endlft => . ... </k>
     <currentLft> L:Int => L -Int 1 </currentLft>
     <stackEnv> ListItem(Rho) => .List ...  </stackEnv>
     <tcenv> _ => Rho:Map </tcenv>
//     <vInfo> VR:Map => removeVarbyLft(L,VR) </vInfo> //Maybe it's better to retain all the vInfo.

     

rule removeVarbyLft(L:Int, (V:KItem |-> varInfo(E:Exp,R:CoreTy,L)) M:Map) => removeVarbyLft(L,M)

rule removeVarbyLft(L:Int, V:KItem |-> varInfo(E:Exp,R:CoreTy,L1:Int) M:Map)
     			       => (V |-> varInfo(E,R,L1)) removeVarbyLft(L,M)
     requires L =/=Int L1

rule removeVarbyLft(_:Int, .Map) => .Map


rule <k> #removeLifetime1(L:Int, (K |-> V) R1:Map, R2:Map,S:Set)
     	 			=> #removeLifetime2(L,R1,K,V,R2,S) ... </k>



rule <k> #removeLifetime2(L:Int, M1:Map, V, varInfo(_,_,L), M2:Map, S:Set)
     	 			=> #removeLifetime1(L,M1,M2, SetItem(V) S) ... </k>

rule <k> #removeLifetime2(L:Int, R1:Map, V, varInfo(X,T,L1:Int), R2:Map, S:Set)
     	 	=> #removeLifetime1(L,R1,(V |-> varInfo(X,T,L1)) R2,S) ... </k>
     requires L =/=Int L1



rule <k> #removeLifetime1(_,.Map,R2:Map,S:Set) => . ... </k>



endmodule