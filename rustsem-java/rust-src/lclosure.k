

/***************************************

	The design for closure

The closure is very important in Rust.
The processing can be summarized in the following steps:

1. scan the body of the closure, we need two set:
   (1) the set of free variables, (2) the set of local variables

(2) for each statement in the body of closure, if encounter
    a variable only in free variable. Then identify whether
    it is borrowed or moved.
    

****************************************/

module LCLOSURE

imports TYDEF
imports SRUST-SYNTAX
imports CONFIGURATION
imports CLANG
imports TRANSLATION
imports LFUNCTION

/*@***************************************************

	The rules for closure

1. The parameters will be translated into the parameters of functions

  1. unwrap parameters
  2. detect free variables
  3. 


******************************************************/

syntax List
       ::= #unwrapCP(TypeIds)		[function]
         | #detectFreeVars(K,List)	[function]
	 | #detectLocalVars(K)		[function]


syntax Bool
       ::= inList(K,List)    [function]

rule inList(E:KItem, ListItem(E) Rest:List) => true
rule inList(E:K, .List) => false
rule inList(E:K, ListItem(E1) Rest:List) => inList(E,Rest)
     requires E =/=K E1

syntax Idents
       ::= #unwrapCPIds(TypeIds)		[function]

syntax CoreTys
       ::= #unwrapCPTys(TypeIds,Map)		[function]

syntax Stmts
       ::= #closeBody(List,K)
         | #mcloseBody(List,K)

syntax ClosureItem
       ::= #setClosureTy(KItem,CoreTys,Ident)			[strict(1)]
         | #extractClosureFunId(Ident)

rule <k> #extractClosureFunId(F:Ident) => #expTy(F, #owner(T)) ... </k>
     <typeCtx> ... F |-> T:CoreTy  ... </typeCtx>

rule #closureExp(Cs:TypeIds, E:Exp) => #closureBlock(Cs, {val(E)})

rule <k> #setClosureTy(#void,Ts:CoreTys,funId(C:Int)) => . ... </k>
     <typeCtx> .Map => funId(C) |-> #closureTy(#envId(C), fnTy(Ts) -> #void) ... </typeCtx>

rule <k> #setClosureTy(#expTy(_,T:CoreTy),Ts:CoreTys,funId(C:Int)) => . ... </k>
     <typeCtx> .Map => funId(C) |->  #closureTy(#envId(C), fnTy(Ts)->T) ...  </typeCtx>


rule #mclosureExp(Cs:TypeIds, E:Exp) => #mclosureBlock(Cs, {val(E)})


rule #closureBlock(Cs:TypeIds, { Ss:Stmts E:Exp}) => #closureBlock(Cs, { #ExpStmts2Stmts(Ss,E) })
rule #mclosureBlock(Cs:TypeIds, { Ss:Stmts E:Exp}) => #mclosureBlock(Cs, { #ExpStmts2Stmts(Ss,E) })

rule #closureBlock(Cs:TypeIds, {Ss:Stmts}) => #mclosureBlock(Cs, {Ss})
      



rule #unwrapCP(.TypeIds) => .List
rule #unwrapCP(X:Ident : T:RSType, RestC:TypeIds) => ListItem(X) #unwrapCP(RestC)

rule #unwrapCPIds(.TypeIds) => .Idents
rule #unwrapCPIds(X:Ident : T:RSType, RestC:TypeIds) => X, #unwrapCPIds(RestC)


rule #unwrapCPTys(.TypeIds,M:Map) => .CoreTys
rule #unwrapCPTys(X:Ident : T:RSType, RestC:TypeIds,  M:Map)
     			  => #CoreTys(#RStoCT(T,M), #unwrapCPTys(RestC,M))


/*******************************************************

********************************************************/
rule #detectFreeVars(X:Ident, Xs:List) => ListItem(X) 
     requires notBool inList(X,Xs)

rule #detectFreeVars(X:Ident, Xs:List) => .List
     requires inList(X,Xs)

rule #detectFreeVars(let X:Ident = E:Exp; , L:List) => #detectFreeVars(E, L)
rule #detectFreeVars(let mut X:Ident = E:Exp ;, L:List) => #detectFreeVars(E,  L)
rule #detectFreeVars(E1:Exp == E:Exp,L) => #detectFreeVars(E1,L) #detectFreeVars(E,L)
rule #detectFreeVars(E1:Exp = E:Exp,L) => #detectFreeVars(E1,L) #detectFreeVars(E,L)
rule #detectFreeVars(E:Exp ;, L) => #detectFreeVars(E,L)
rule #detectFreeVars(S:Stmt Ss:Stmts, L) => #detectFreeVars(S,L) #detectFreeVars(Ss,L)
rule #detectFreeVars(val(E:Exp),L) => #detectFreeVars(E,L)

rule #detectFreeVars(* E:Exp,L:List) => #detectFreeVars(E,L)

rule #detectFreeVars(E1:Ident :: E2:Ident (E:Exp), L:List) => #detectFreeVars(E, L)

rule #detectFreeVars(.Stmts,L) => .List


rule #detectFreeVars(E1:Exp + E2:Exp, L:List) => #detectFreeVars(E1,L) #detectFreeVars(E2,L)
rule #detectFreeVars(_:Int,_) => .List
rule #detectFreeVars(_:Bool,_) => .List

rule #detectFreeVars(E:Exp . E1:Exp, L:List) => #detectFreeVars(E, L)

rule #detectFreeVars(println!(S:String, Es:Exps); , L:List) => #detectFreeVars(Es, L)
rule #detectFreeVars(E:Exp, Es:Exps, L:List) => #detectFreeVars(E,L) #detectFreeVars(Es,L)

rule #detectFreeVars(.Exps,L:List) => .List

rule #detectFreeVars(#funCall(E1:Exp, Es:Exps),L:List) => #detectFreeVars(Es,L)


/*******************************************/

rule #detectLocalVars(S:Stmt Ss:Stmts) => #detectLocalVars(S) #detectLocalVars(Ss)
rule #detectLocalVars(.Stmts) => .List

rule #detectLocalVars(E:Exp ;) => #detectLocalVars(E)
rule #detectLocalVars(E:Exp) => .List
rule #detectLocalVars(val(E:Exp)) => .List
rule #detectLocalVars(let X:Ident = E:Exp ;) => ListItem(X)
rule #detectLocalVars(E1:Exp == E:Exp) => .List
rule #detectLocalVars(E1:Exp = E:Exp) => .List
rule #detectLocalVars(let mut X:Ident = E:Exp ;) => ListItem(X)
rule #detectLocalVars(println!(S:String, Es:Exps);) => .List


/********************************************/


rule #mcloseBody(ListItem(X:Ident) Ls:List, E:Exp) => { let X = X ; #mcloseBody(Ls,E) }
rule #mcloseBody(.List, E:Exp) => val(E)

//rule #mcloseBody(Ls:List, {Ss:Stmts}) => #mcloseBody(Ls,Ss)
//rule #closeBody(Ls:List, {Ss:Stmts}) => #closeBody(Ls,{ Ss })

rule #closeBody(ListItem(X:Ident) Ls:List, Ss:Stmts) => #closeBody(Ls,Ss) 
rule #closeBody(.List, Ss:Stmts) => Ss

rule #mcloseBody(ListItem(X:Ident) Ls:List, Ss:Stmts) => { let X = X ; #mcloseBody(Ls,Ss) }
rule #mcloseBody(.List, Ss:Stmts) => Ss


syntax TypeIds
       ::= #envTys(List, Map, Map)			[function]

syntax ClosureItem
       ::= #createEnv(List)
         

syntax CoreTy
       ::= #TypeVarInfo(K)				[function]

rule #envTys((ListItem(X:Ident) L:List), ENV:Map, VAR:Map) =>
     		      #typeId1(X, #TypeVarInfo(VAR[var(unwrapInt(ENV[X]))])), #envTys(L,ENV,VAR)

rule #envTys(.List, _:Map, _:Map) => .TypeIds

rule #TypeVarInfo(varInfo(_,T:CoreTy,_)) => T


syntax IdVals
       ::= #envIdVals(List)		[function]

syntax List
       ::= #uniqueList(List)		[function]

rule #uniqueList(ListItem(E) L:List) => #uniqueList(L)
     requires E in #list2Set(L)

rule #uniqueList(ListItem(E) L:List) => ListItem(E) #uniqueList(L)
     requires notBool (E in #list2Set(L))

rule #uniqueList(.List) => .List


rule <k> #createEnv(L:List) => #env(N) { #envTys(L, ENV, VAR) }
     	 		          ~>  #envitem(#prodInit(#env(N),#envIdVals(L)))  ... </k>
     <closureId> N:Int => N +Int 1 </closureId>
     <tcenv> ENV:Map </tcenv>
     <vInfo> VAR:Map </vInfo>

rule #envitem(#expTy(E,T)) => #pushTerm(#envitem(#transExp(E)))

rule #envIdVals(ListItem(X:Ident) L:List) => #IdVals(#IdVal(X,X), #envIdVals(L))

rule #envIdVals(.List) => .IdVals

syntax Stmts
       ::= #mclosureBody(Int, List, Stmts)			[function]

rule #mclosureBody(I:Int, (ListItem(X:Ident) L:List), Ss:Stmts) => let X = #envId(I).X ; #mclosureBody(I,L,Ss)
rule #mclosureBody(I, .List, Ss:Stmts) => Ss

//rule #void ~> bindParamTys(Is:Idents; Ts:CoreTys) => bindParamTys(Is;Ts)

rule #void ~> #newlft => #newlft


syntax ClosureTerm
       ::= #mclosureBlockNext(Int, TypeIds, Stmts)

rule <k> #mclosureBlock(Cs:TypeIds, { Ss:Stmts })
            => #createEnv(#uniqueList(#detectFreeVars(Ss, #detectLocalVars(Ss) #unwrapCP(Cs))))
	         ~> #mclosureBlockNext(C, Cs, Ss) ... </k>
     <closureId> C:Int </closureId>

rule #expTy((#),#void) ~> #mclosureBlockNext(C:Int,Cs:TypeIds, Ss:Stmts)
     		       	  => #mclosureBlockNext(C,Cs,Ss)

rule <k> #mclosureBlockNext(C:Int, Cs:TypeIds, Ss:Stmts) => 
	     #newlft ~> #bindParamTys(#envId(C), #unwrapCPIds(Cs);
	       #CoreTys(#owner(#unwrapCoreTy(TYPECTX[#env(C)])), #unwrapCPTys(Cs,TYPECTX)))
	        ~> #pushParams(#envId(C), #unwrapCPIds(Cs)) ~> #pushTerm(#separation)
	        ~> #setClosureTy(#mclosureBody(C, #uniqueList(#detectFreeVars(Ss, #detectLocalVars(Ss) #unwrapCP(Cs))), Ss), #unwrapCPTys(Cs,TYPECTX), funId(C)) ~>  #tblockend ~> #endlft ~> #pushEnv(#envId(C))
	~> #tfunItem(funId(C)) ~> #extractClosureFunId(funId(C)) ... </k>
	<typeCtx> TYPECTX:Map </typeCtx>

syntax K
       ::= #pushEnv(Ident)


rule <k> #pushEnv(E:Ident) => #pushTerm(E) ... </k>





endmodule

















