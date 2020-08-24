
require "tydef.k"
require "srust-syntax.k"
require "configuration.k"
require "translation.k"
require "lexpression.k"
require "lib.k"

module LFUNCTION

imports TYDEF
imports SRUST-SYNTAX
imports CONFIGURATION
imports LEXPRESSION
imports TRANSLATION
imports LIB


/****************************************************************@
	The Decomposition of Function Definition
*****************************************************************/

syntax TyCKItem
       ::= argTyCK(K,K)	
	 | "#bindParamTys" "(" K ";" K ")"
	 | contTyCK(K,K)

rule ifn F:Ident (P:Idents) {Ss:Stmts E:Exp} => ifn F (P) {#ExpStmts2Stmts(Ss,E)}

rule [FunctionDef]:
     <k> ifn F:Ident (P:Idents) { Ss:Stmts }
     	 	=>  #newlft ~> #bindParamTys(P;Ts) ~> #pushParams(P)
     	     	    ~> #pushTerm(#separation)
		    ~> #pushTerm(#tblockStart)
		    ~> Ss @-> #tblockend
		    ~>  #tfunItem(F) ~> #endlft ...
     </k>
     <typeCtx> ... F |-> fnTy(Ts:CoreTys) -> T:CoreTy ...  </typeCtx>

rule <k> #pushParams(Ps:Idents) => #pushTerm(#getIds(Ps,Rho)) ... </k>
     <tcenv> Rho:Map </tcenv>


/* Don't delete
rule <k> call F:Ident (Rs:ExpTys) =>
     	 #expTy(call F ( Rs ), #replaceTvars(#getReplaceTerms(Rs,Ts), T)) ... </k>
     <typeCtx> ... (F |-> fnTy(Ts:CoreTys) -> T:CoreTy) ... </typeCtx>
*/

rule <k> call F:Ident (Rs:ExpTys) =>
     	 #expTy(call F ( Rs ), T) ... </k>
     <typeCtx> ... (F |-> fnTy(Ts:CoreTys) -> T:CoreTy) ... </typeCtx>

rule <k> call F:Ident (Rs:ExpTys) =>
     	 #expTy(call F ( Rs ), T) ... </k>
     <vInfo> ... (F |-> varInfo(_,fnTy(Ts:CoreTys) -> T:CoreTy,_)) ... </vInfo>


rule <k> call F:Ident (Rs:ExpTys) =>
     	 #expTy(call var(C) (Rs),T) ... </k>
     <tcenv> ... F |-> C:Int ... </tcenv>
     <vInfo> ... var(C) |-> varInfo(_,fnTy(Ts:CoreTys) -> T:CoreTy,_) ... </vInfo>

/* Do not delete this rule
rule <k> call F:Ident (Rs:ExpTys) =>
           #expTy(call F(#exptylist(#expTy(#envId(I), own(#prodId(#env(I)))), Rs)), T) ... </k>
     <typeCtx> ... F |-> #closureTy(#envId(I:Int), fnTy(Ts:CoreTys) -> T:CoreTy) ...  </typeCtx>
*/

/*
rule <k> call F:Ident (Rs:ExpTys) =>
     	 #expTy(call F (#gettraitObjs(Rs,Ts)),T) ... </k>
     <vInfo> ... F |-> varInfo(_,fnTy(Ts:CoreTys;T:CoreTy),_) ... </vInfo>

rule <k> call #cpath(T:CoreTy, F:Id) (Rs:ExpTys) =>
     	 #expTy(call #cpath(T,F) (Rs),T1) ... </k>
     <typeCtx> ... (#cpath(T,F) |-> fnTy(Ts:CoreTys; T1:CoreTy)) ... </typeCtx>
*/


rule <k> polycall #tpath(E:Exp,T:CoreTy, F:Id) (Rs:ExpTys) =>
     	      #expTy(polycall #tpath(E, T, F) (Rs),T1) ... </k>
     <typeCtx> ... (#cpath(T,F) |-> fnTy(Ts:CoreTys) -> T1:CoreTy) ... </typeCtx>
     <currentLft> L:Int </currentLft>

/*
rule #gettraitObjs(exptylist(E:ExpTy, Es:ExpTys), T:CoreTy, Ts:CoreTys)
     		=> exptylist(E, #gettraitObjs(Es,Ts))
     requires sortIndex(#getTyId(T)) ==Int 17 orBool sortIndex(#getTyId(T)) ==Int 18		

rule #gettraitObjs(exptylist(E:ExpTy, Es:ExpTys), T:CoreTy, Ts:CoreTys)
     		=> exptylist(#traitObj(E), #gettraitObjs(Es,Ts))
     requires sortIndex(#getTyId(T)) ==Int 17 orBool sortIndex(#getTyId(T)) ==Int 18

rule #gettraitObjs(exptylist(E:ExpTy, Es:ExpTys), T:CoreTy, Ts:CoreTys)
     		=> exptylist(E,#gettraitObjs(Es,Ts))
     requires sortIndex(#getTyId(T)) =/=Int 17 andBool sortIndex(#getTyId(T)) =/=Int 18		

rule #gettraitObjs(.ExpTys, .CoreTys) => .ExpTys



syntax TyCKItem
       ::= processArg(Exp,CoreTy)	[strict(1)]

rule argTyCK(E:Exp, Rs:Exps, T2:CoreTy, Ts:CoreTys)
				=> processArg(E,T2) ~> argTyCK(Rs,Ts)

rule processArg(#expTy(L,T1:CoreTy),T2:CoreTy) =>  move(#expTy(L,T1))


rule argTyCK(.Exps,.CoreTys) => .

*/

/*************************************************@
	Binding Arguments of Parameters
**************************************************/

rule #bindParamTys((P:Ident,Ps:Idents); #CoreTys(T:CoreTy, Ts:CoreTys)) => 
     	     #createVar(P,imm,T) ~> #bindParamTys(Ps;Ts)

rule #bindParamTys(.Idents; .CoreTys) => .



syntax PairItem
       ::= #Pair(K,K)
         | #splitTyIds(K,Map)		[function]
	 | #addHeadPair(K,K,PairItem)	[function]

syntax K
       ::= #first(PairItem)		[function]
         | #second(PairItem)		[function]


rule #first(#Pair(F:K,_:K)) => F
rule #second(#Pair(_:K,F:K)) => F

rule #addHeadPair(X:Ident, T:CoreTy, #Pair(Is:Idents, Ts:CoreTys)) => #Pair(X, Is, #CoreTys(T, Ts))

rule #splitTyIds(X:Ident : T:RSType, Ts:TypeIds, M:Map)
     			   => #addHeadPair(X,#RStoCT(T,M),#splitTyIds(Ts,M))

rule #splitTyIds(mut X:Ident : T:RSType, Ts:TypeIds, M:Map)
     			   => #addHeadPair(X,#RStoCT(T,M),#splitTyIds(Ts,M))


rule #splitTyIds(self, Ts:TypeIds, M:Map) =>
     		       		#splitTyIds(#selfX : #tyself, Ts:TypeIds, M:Map)
				   
rule #splitTyIds(& mut self, Ts:TypeIds, M:Map) =>
     		                #splitTyIds(#selfX : #ref(#tyself), Ts:TypeIds, M:Map)
				   
rule #splitTyIds(& self, Ts:TypeIds, M:Map) =>
     		   	 	#splitTyIds(#selfX : #ref(#tyself), Ts:TypeIds, M:Map)

rule #splitTyIds(.TypeIds,_:Map) => #Pair(.Idents, .CoreTys)


/************************************************************************/

rule fn F:Ident <_:GParams> (Ts:TypeIds) B:Block => fn F (Ts) -> #void B

rule <k> fn F:Ident <_:GParams> (Ts:TypeIds) -> T:RSType B:Block
     	    	    		=> fn F (Ts) -> #RStoCT(T,Rho)  B ... </k>
     <typeCtx> Rho:Map </typeCtx>

rule pub FunDecl => FunDecl

rule fn F:Ident (Ts:TypeIds) B:Block => fn F (Ts) -> #void B

rule unsafe F:FunDecl => F


rule <k> fn F:Ident (Ts:TypeIds) -> T:RSType B:Block =>
     	    	    F :=: fnTy(#exCoreTys(#second(#splitTyIds(Ts,Rho))))
		      -> #RStoCT(T,Rho) ~>
		      ifn F (#exIdents(#first(#splitTyIds(Ts,Rho)))) B ... </k>
     <typeCtx> Rho:Map </typeCtx>


syntax PFunitem
       ::= #insertProcess(FunDeclC, K)

rule #insertProcess(unsafe F:FunDecl, IP:K) => #insertProcess(F, IP)

rule <k> #insertProcess(fn F:Ident (Ts:TypeIds) -> T:RSType B:Block, IP:K)
     	 		   	   =>
	     F :=: fnTy(#exCoreTys(#second(#splitTyIds(Ts,Rho)))) -> #RStoCT(T,Rho) ~> IP ~>
	     ifn F (#exIdents(#first(#splitTyIds(Ts,Rho)))) B
	     ...
     </k>
     <typeCtx> Rho:Map </typeCtx>

syntax Idents
       ::= #exIdents(K)				[function]

syntax CoreTys
       ::= #exCoreTys(K)				[function]

rule #exIdents(Is:Idents) => Is

rule #exCoreTys(Rs:CoreTys) => Rs

//rule F:Ident (Es:ExpTys) => call F (Es)

syntax FunDecl
       ::= #normFun(FunDecl)			[function]



endmodule