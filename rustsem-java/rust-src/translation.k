
require "configuration.k"
require "srust-syntax.k"
require "sortindex.k"


module TRANSLATION

imports CONFIGURATION
imports SRUST-SYNTAX
//imports LIB
imports SORTINDEX
imports SORTINDEXCL
//imports RMAP

syntax TransItems
       ::= #tfunItem(Ident)      //The first parameter is the name of the function
	   		       	 	//and second one is the parameters of the function
	 | "#tbindItem"
	 | "#texpStmtItem"
	 | "#tvalStmtItem"
	 | "#tcombine"
	 | "#tassignItem"
	 | #tifelseItem(Exp)
	 | #tcaseItem(Exp)
	 | #tcaseBlks(Blocks)
	 | #tcaseTmp(K)
	 | #CaseExpTy(KItem)	[strict]
	 | #ifexpTy(KItem)		[strict]
	 | #tmatch(GuardedActions)
	 | "#tReturnItem"
	 | "#tpanic"
	 | "#tloop"
	 | "#twhile"


syntax ExpTy
       ::= "#expTyCase"
         | "#expTyIf"
 
syntax SeparationTerm
       ::= "#separation"
         | "#tcaseStart"
	 | "#tblockStart"
	 | "#tblockend"
	 | "#tblocksep"
	 | "#tbindstart"
	 | "#tassignstart"
	 | "#tmatchbegin"



syntax TransItems
       ::= #pushTerm(K)
         | #pushTerms(K,K)


syntax TyCKItem
       ::= #pushParams(Idents)


rule <k> #pushTerm(T:KItem) => . ... </k>
     <tstack> .List => ListItem(T) ...  </tstack>

rule <k> #tpanic => . ... </k>
     <tstack> ListItem(#expTy(E:Exp,_:CoreTy)) => ListItem(#stop) ...  </tstack>

rule #pushTerms(T1:K,T2:K) => #pushTerm(T1) ~> #pushTerm(T2)


rule <k> #tbindItem => . ... </k> 
     <tstack> (ListItem(#expTy(var(I:Int),_)) ListItem(#expTy(E:Exp,T)) ListItem(#tbindstart)) =>
     	ListItem(letcl #getId(I) =cl #isMove(#transExp(E),T)
	            incl (
		         #drop(callcl(#cpath(T,String2Id("drop")), refcl(1, #getId(I)), .ExpCLs)))
	        ) ... </tstack>
     <cpable> CS:Set </cpable>
     <typeCtx> TYPECTX:Map </typeCtx>
     requires (E =/=K #expTyCase ) andBool (#cpath(T, String2Id("drop")) in keys(TYPECTX))


rule <k> #tbindItem => . ... </k> 
     <tstack> (ListItem(#expTy(var(I:Int),_)) ListItem(#expTy(E:Exp,T)) ListItem(#tbindstart)) =>
     	ListItem(letcl #getId(I) =cl #isMove(#transExp(E),T)
	            incl ( clskip)
	        ) ... </tstack>
     <cpable> CS:Set </cpable>
     <typeCtx> TYPECTX </typeCtx>
     requires (E =/=K #expTyCase ) andBool (notBool (#cpath(T,String2Id("drop")) in keys(TYPECTX)))
     


rule <k> #tbindItem =>  . ... </k> 
     <tstack>
	(ListItem(#expTy(var(I:Int),_))
	 ListItem(#expTy(#expTyCase,T:CoreTy))
	 ListItem(E:ExpCL)
	 ListItem(#tbindstart)) =>
     	 ListItem(letcl #getId(I) =cl #isMove(E,T) incl clskip) ... </tstack>
     <cpable> CS:Set </cpable>

rule <k> #tbindItem =>  . ... </k> 
     <tstack>
	(ListItem(#expTy(var(I:Int),_))
	 ListItem(#expTy(funId(_:Int),T:CoreTy))
	 ListItem(E:ExpCL)
	 ListItem(#envitem(EP:ExpCL))
	 ListItem(#tbindstart)) =>
     	 ListItem(letcl #getId(I) =cl #AllocateInitRaw(valcl(2),T,EP,E) incl clskip) ... </tstack>
     <cpable> CS:Set </cpable>

rule <k> #tloop => . ... </k>
     <tstack>
	(ListItem((| E:ExpCL |)) => ListItem(#loop valcl(0) {(| E |)})
	)
	...
     </tstack>

rule <k> #twhile => . ... </k>
     <tstack>
       (ListItem((| E:ExpCL |))
        ListItem(#expTy(E1:Exp,_:CoreTy))	
	) => ListItem(#loop #transExp(E1) {(| E |)})
	...
     </tstack>


rule <k> #tbindItem =>  . ... </k> 
     <tstack>
	(ListItem(#expTy(var(I:Int),_))
	 ListItem(#expTy(funId(_:Int),T:CoreTy))
	 ListItem(E:ExpCL)
	 ListItem(letcl X:Ident =cl B:ExpCL incl B1:ExpCL)
	 ListItem(#tbindstart)) =>
     	 ListItem(letcl X =cl B incl (B1 ;cl letcl #getId(I) =cl #isMove(E,T) incl clskip)) ... </tstack>
     <cpable> CS:Set </cpable>



rule <k> #tbindItem => . ... </k> 
     <tstack>
	(ListItem(#expTy(var(I:Int),_))
	 ListItem(#expTy(#expTyIf,T:CoreTy))
	 ListItem(E:ExpCL) ListItem(#tbindstart)) =>
     	 ListItem(letcl #getId(I) =cl  #isMove(E,T) incl clskip) ... </tstack>
     <cpable> CS:Set </cpable>

syntax ExpCL
       ::= #isMove(ExpCL, CoreTy)		[function]

rule #isMove(E:ExpCL,#owner(T:CoreTy)) => #move(E)
     requires (sortIndex(T) =/=Int 20) andBool
     	      ((termIndex(E) ==Int 10000) orBool (termIndex(E) ==Int 100021)
	        orBool (termIndex(E) ==Int 100022) orBool (termIndex(E) ==Int 100054))

rule #isMove(E:ExpCL,#ty(_)) => #move(E)
     requires 
     	      ((termIndex(E) ==Int 10000) orBool (termIndex(E) ==Int 100021)
	        orBool (termIndex(E) ==Int 100022))

rule #isMove(E:ExpCL,#ty(_)) => E
     requires notBool
     	      ((termIndex(E) ==Int 10000) orBool (termIndex(E) ==Int 100021)
	        orBool (termIndex(E) ==Int 100022))


rule #isMove(E:ExpCL, #owner(#raw(T:CoreTy))) => E

rule #isMove(E:ExpCL,T:CoreTy) => E
     requires ((sortIndex(T) =/=Int 3) andBool (sortIndex(T) =/=Int 23) )orBool (
         (termIndex(E) =/=Int 10000)
	    andBool (termIndex(E) =/=Int 100021)
	      andBool (termIndex(E) =/=Int 100022))




rule <k> #tcombine => #tcombine ... </k>
     <tstack>
	(ListItem(E:ExpCL)
	 ListItem(letcl X2 =cl E2 incl F2)) =>
	 ListItem(
	   seqcomb(letcl X2 =cl E2 incl F2, E)
	 )
	 ...
     </tstack>

rule <k> #tcombine => #tcombine ... </k>
     <tstack>
	(ListItem(E:ExpCL)
	 ListItem(E1:ExpCL :=cl E2:ExpCL) =>
	 ListItem(
	   E1 :=cl E2 ;cl E
	 ))
	 ...
     </tstack>

rule <k> #tcombine => #tcombine ... </k>
     <tstack>
	(ListItem(E:ExpCL)
	 ListItem(#loop E1:ExpCL { E2:ExpCL }) =>
	 ListItem(
	    #loop E1 {E2} ;cl E
	 ))
	 ...
     </tstack>


rule <k> #tcombine => #tcombine ... </k>
     <tstack>
	(ListItem(E:ExpCL)
	 ListItem(F:FnCL) =>
	 ListItem(
	   F ;cl E
	 ))
	 ...
     </tstack>


rule <k> #tcombine => #tcombine ... </k>
     <tstack>
	(ListItem(E:ExpCL)
	 ListItem(#print(S:String,Es:ExpCLs)) =>
	 ListItem(
	   #print(S,Es) ;cl E
	 ))
	 ...
     </tstack>


rule <k> #tcombine => #tcombine ... </k>
     <tstack>
       (ListItem(E:ExpCL) ListItem(E1:ExpCL ;cl E2) => 
        ListItem(E1 ;cl E2 ;cl E)
       )
          ...
     </tstack>

rule <k> #tcombine => #tcombine ... </k>
     <tstack>
       (ListItem(E:ExpCL) ListItem(#stop) => 
        ListItem(#stop ;cl E)
       )
          ...
     </tstack>


rule <k> #tcombine => #tcombine ... </k>
     <tstack>
       (ListItem(E:ExpCL) ListItem(#retcl(E1:ExpCL)) => 
        ListItem(#retcl(E1) ;cl E)
       )
          ...
     </tstack>


rule <k> #tcombine => #tcombine ... </k>
     <tstack>
	(ListItem(E:ExpCL)
	 ListItem((| E1:ExpCL |)) =>
	 ListItem((| E1 |) ;cl E)
	 )
	 ...
     </tstack>

rule <k> #tcombine => #tcombine ... </k>
     <tstack>
	(ListItem(E:ExpCL)
	 ListItem(ifcl E1:ExpCL thencl E2:ExpCL elsecl E3:ExpCL ) =>
	 ListItem(ifcl E1 thencl E2 elsecl E3 ;cl E)
	 )
	 ...
     </tstack>

rule <k> #tcombine => #tcombine ... </k>
     <tstack>
	(ListItem(E:ExpCL) ListItem(refcl(Se:Int,E1:ExpCL))) => ListItem(refcl(Se,E1) ;cl E)
	...
     </tstack>


rule <k> #tcombine => #tcombine ... </k>
     <tstack>
	(ListItem(E:ExpCL) 
	 ListItem(E1:ExpCL :=cl O:Order E2:ExpCL)
	) =>
	ListItem(
	  E1 :=cl O E2 ;cl E
	)
	...
     </tstack>

rule <k> #tcombine => #tcombine ... </k>
     <tstack>
	(ListItem(E:ExpCL) 
	 ListItem(assertcl(E1:ExpCL))
	) =>
	ListItem(
	  assertcl(E1) ;cl E
	)
	...
     </tstack>

rule <k> #tcombine => #tcombine ... </k>
     <tstack>
	(ListItem(E:ExpCL) 
	 ListItem(#referto(E1:ExpCL,E2:ExpCL))
	) =>
	ListItem(
	  #referto(E1,E2) ;cl E
	)
	...
     </tstack>


rule <k> #tcombine => #tcombine ... </k>
     <tstack>
	(ListItem(E:ExpCL) 
	 ListItem(callcl(E1:ExpCL, Es:ExpCLs))
	) =>
	ListItem(
	  callcl(E1,Es) ;cl E
	)
	...
     </tstack>


rule <k> #tcombine => . ... </k>
     <tstack>
	ListItem(E:ExpCL)    //ListItem(letcl X1 =cl E1 incl F1)
	.List
     </tstack>

rule <k> #tcombine => . ... </k>
     <tstack>
	ListItem(_)
	ListItem(#tbindstart)
	...
     </tstack>


rule <k> #tcombine => . ... </k>
     <tstack>
	ListItem(_)    //ListItem(letcl X1 =cl E1 incl F1)
	ListItem(#separation)
	...
     </tstack>

rule <k> #tcombine => . ... </k>
     <tstack>
	ListItem(_)    //ListItem(letcl X1 =cl E1 incl F1)
	ListItem(#tcaseStart)
	...
     </tstack>


rule <k> #tcombine => #tcombine ... </k>
     <tstack>
	(ListItem(letcl X1 =cl E1 incl F1)
	ListItem(fun X:Ident (Ps) {B})) =>
	ListItem(fun X (Ps) {B} ;cl letcl X1 =cl E1 incl F1)
	...
     </tstack>

rule <k> #tcombine => . ... </k>
     <tstack>
	ListItem(letcl X1 =cl E1 incl F1)
	ListItem(_:Idents)
     </tstack>


rule <k> #tfunItem(F:Ident) => . ... </k>
     <tcenv> Rho:Map </tcenv>
     <tstack> (ListItem(E) ListItem(#separation) ListItem(Ps))
     	       => ListItem(fun F (unwrapIds(Ps)) { #unwrapExpCL(E) })
     	      ... </tstack>

rule <k> #tfunItem(F:Ident) => . ... </k>
     <tcenv> Rho:Map </tcenv>
     <tstack> (ListItem(Env:Ident) ListItem(E) ListItem(#separation) ListItem(Ps))
     	       => ListItem(fun F (unwrapIds(Ps)) { #unwrapExpCL(E) })
     	      ... </tstack>


rule <k> #tifelseItem(E:Exp) => . ... </k>
     <tstack>
       ((
        ListItem(E1:ExpCL)
	ListItem(E2:ExpCL)) => ListItem(ifcl #transExp(E) thencl E2 elsecl E1))
	...
     </tstack>
     requires (E =/=K #expTyIf) andBool (E =/=K #expTyCase)

rule <k> #tifelseItem(E:Exp) => . ... </k>
     <tstack>
       (ListItem(E1:ExpCL)
	ListItem(E2:ExpCL)
	ListItem(C:ExpCL) => ListItem(ifcl (C) thencl E2 elsecl E1))
	...
     </tstack>
     requires (E ==K #expTyIf) orBool (E ==K #expTyCase)


rule #tcaseBlks(B:Block, Bs:Blocks) => B  ~> #tcaseBlks(Bs)
     requires Bs =/=K .Blocks

rule E:ExpTy ~> #tcaseBlks(Bs) => #tcaseBlks(Bs)


rule #tcaseBlks(B:Block, .Blocks) => #CaseExpTy(B)

rule #CaseExpTy(#expTy(E,T:CoreTy)) => #expTy(#expTyCase,T)
rule #CaseExpTy(#void) => #void


rule #ifexpTy(#expTy(E,T:CoreTy)) => #expTy(#expTyIf,T)
rule #ifexpTy(#void) => #void



rule #tcaseBlks(.Blocks) => .

rule <k> #tcaseItem(E:Exp) => #tcaseTmp(casecl #transExp(E) of {.ExpCLs}) ... </k>

rule <k> #tcaseTmp(casecl E:ExpCL of {Es:ExpCLs}) =>
     	 		  #tcaseTmp(casecl E of {(#unwrapExpCL(E1)), Es}) ... </k>
     <tstack>
	ListItem(E1:ExpCL) => .List
	...
     </tstack>

/*
rule <k> #tcaseTmp(casecl E:ExpCL of {Es:ExpCLs}) =>
     	 		  #tcaseTmp(casecl E of {(#unwrapExpCL(E1)), Es}) ... </k>
     <tstack>
        (ListItem(#tblocksep)
	ListItem(E1)  => .List)
	ListItem(#tcaseStart)
	...
     </tstack>
*/

rule <k> #tcaseTmp(casecl E:ExpCL of {Es:ExpCLs}) => . ... </k>
     <tstack>
	ListItem(#tcaseStart) =>
	(
	 ListItem(casecl E of {Es})
	)
	...
     </tstack>

rule #tblockend => #tcombine

rule <k> #tcombine => . ... </k>
     <tstack>
       (ListItem(E:ExpCL)
	ListItem(#tblockStart)) => ListItem((| E |))
	...
     </tstack>

rule <k> #tcombine => . ... </k>
     <tstack>
       (ListItem(E:GuardedAction)
	ListItem(#tblockStart)) => ListItem(E)
	...
     </tstack>


/*
rule <k> #tcombine => . ... </k>
     <tstack>
	ListItem(_)
	ListItem(#tblockStart)
	...
     </tstack>
*/

rule <k> #tcombine => . ... </k>
     <tstack>
	(ListItem(E2:ExpCL)
	 ListItem(#tblocksep)
	 ListItem(E1:ExpCL)) => ListItem(E1 ;cl E2)
	 ...
     </tstack>



syntax ExpCL
       ::= #transExp(Exp)		[function]
         | #transFun(Exp,Set)		[function]


syntax ExpCLs
       ::= #transExps(Exps)		[function]

syntax Ident
       ::= #getId(K)			[function]

syntax Idents
         ::= #getIds(Idents,Map)	[function]

rule #transExp(#lenStr(E:Exp)) => #lenStrcl(#transExp(E))

rule #transExp(#Undef_Value) => #uninit(0)

rule #transExp(#expcl(E:ExpCL)) => E

rule #transExp(X:Id) => X

rule #transExp(var(I:Int))    => #getId(I)
rule #transExp(funId(I:Int))  => funId(I)
rule #transExp(cvar(E1:Exp,E2:Int)) => #transExp(E1) .cl #transExp(E2)

rule #transExp(#RIndex(E1:Exp,E2:Exp)) => #Index(#transExp(E1),#transExp(E2))

rule #transExp(#expTy(E,_)) => #transExp(E)
rule #transExp(* E:Exp)       => *cl na #transExp(E)
//rule #transExp(& M:Mut E:Exp) => #transExp(E)
rule #transExp(#Heap(E:Exp,T:CoreTy))   => #Allocate(#transExp(E),T)
rule #transExp(I:Int) => valcl(I)
rule #transExp(F:Float) => valcl(F)
rule #transExp(true)  => valcl(0)
rule #transExp(S:String) => #refallocate(#allocateInit(valcl(1), #owner(str),valcl(S)))
rule #transExp(false) => valcl(1)
rule #transExp((#)) => clskip
rule #transExp(E1:Exp + E2:Exp) => #transExp(E1) +cl #transExp(E2)
rule #transExp(E1:Exp ^ E2:Exp) => #transExp(E1) ^-cl #transExp(E2)
rule #transExp(E1:Exp & E2:Exp) => #transExp(E1) &cl #transExp(E2)
rule #transExp(E1:Exp - E2:Exp) => #transExp(E1) -cl #transExp(E2)
rule #transExp(E1:Exp == E2:Exp) => #transExp(E1) ==cl #transExp(E2)
rule #transExp(E1:Exp . E2:Exp) => #transExp(E1) .cl #transExp(E2)
rule #transExp(E1:Exp * E2:Exp) => #transExp(E1) *-cl #transExp(E2)
rule #transExp(E1:Exp / E2:Exp) => #transExp(E1) /-cl #transExp(E2)
rule #transExp(E1:Exp mod E2:Exp) => #transExp(E1) modcl #transExp(E2)
rule #transExp(E1:Exp <= E2:Exp) => #transExp(E1) <=cl #transExp(E2)
rule #transExp(E1:Exp < E2:Exp) => #transExp(E1) <-cl #transExp(E2)
rule #transExp(E1:Exp > E2:Exp) => #transExp(E1) >-cl #transExp(E2)
rule #transExp(E1:Exp >= E2:Exp) => #transExp(E1) >=cl #transExp(E2)

/*
rule #transExp(#mapAdd(#expTy(L:Exp,_:CoreTy), #expTy(K:Exp,T1:CoreTy),#expTy(V:Exp,T2:CoreTy)))
     	=> #mapAddcl(#transExp(L), #moveVal(#transExp(K),#transExp(K)),#moveVal(#transExp(V),#transExp(V)))

rule #transExp(#mapKeyin(#expTy(L:Exp,_:CoreTy), #expTy(K:Exp,T1:CoreTy)))
     	=> #mapKeyincl(#transExp(L), #transExp(K))

rule #transExp(#mapValue(#expTy(L:Exp,_:CoreTy), #expTy(K:Exp,T1:CoreTy)))
     	=> #mapValuecl(#transExp(L), #transExp(K))
*/

//rule #transExp(#expTy(E1:Exp . E2:Exp,i32)) => #transExp(#expTy(*( E1 . E2),i32))
//rule #transExp(#expTy(E1:Exp . E2:Exp,bool)) => #transExp(#expTy(*( E1 . E2),bool))
//rule #transExp(#expTy(cvar(E1:Exp,I:Int),i32)) => #transExp(#expTy(*cvar( E1,I),i32))
//rule #transExp(#expTy(cvar(E1:Exp,I:Int),bool)) => #transExp(#expTy(*cvar( E1,I),bool))

rule #transExp(& imm E:Exp)   => refcl(0, #transExp(E))
rule #transExp(& mut E:Exp)   => refcl(1, #transExp(E))

rule #transExp(E1:Exp && E2:Exp) => #transExp(E1) &&cl #transExp(E2)
rule #transExp(E1:Exp || E2:Exp) => #transExp(E1) ||cl #transExp(E2)
rule #transExp(#tmp) => #tmp

rule #transExp(call F:Exp (Es:Exps)) => callcl(#transExp(F), #transArgs(Es))

//rule #transFun(call F:Ident (Es:Exps), S:Set) => callcl(F, #transArgs(Es,S))




rule #transExp(polycall #tpath(E:Exp, T:CoreTy, F:Ident) (Es:Exps))
     		       => pcallcl(#transExp(E), F, #transArgs(Es))


rule #transExp(_Rust_memcpy(E1:Exp,E2:Exp,E3:Exp)) => #memcopy(#transExp(E1), #transExp(E2),#transExp(E3))


rule #transExp(#rawpt(E:Exp)) => #RawCL(#transExp(E))
rule #transExp(#intrinsicDeallocate(E:ExpTy)) => #deallocate(#transExp(E))

rule #transExp(_Rust_reallocate(E1:ExpTy,E2:ExpTy)) => #reallocate(#transExp(E1),#transExp(E2))

rule #transExp(#forget(E:ExpTy)) => #transExp(E) :=cl #uninit(0)
rule #transExp(#offsetr(E1:ExpTy,E2:ExpTy)) => #offset(#transExp(E1),#transExp(E2))

rule #transExp(#intrinsicWrite(E1:ExpTy,E2:ExpTy))
     		=> #transExp(E1) :=cl #transExp(E2)

rule #transExp(#intrinsicRead(E:ExpTy)) => #transExp(E)

syntax ExpCLs
       ::= #transArgs(Exps)		[function]

rule #transArgs(#exptylist(#expTy(E,T),Es:ExpTys))
		=> #isMove(#transExp(E),T), #transArgs(Es)



/*
rule #transArgs(exptylist(#expTy(E,T),Es:ExpTys))
		=> #moveVal(#transExp(E),#transExp(E)), #transArgs(Es)
*/


rule #transArgs(#exptylist(#traitObj(E:ExpTy),Es:ExpTys))
		=> #moveVal(#transExp(#traitObj(E)),#transExp(#traitObj(E))), #transArgs(Es)


//rule #transArgs(exptylist(#traitObj(E), Es:ExpTys))
//     		=> #moveVal

rule #transArgs(.ExpTys) => .ExpCLs

rule #transExps(#exptylist(E:ExpTy, Es:ExpTys)) => #transExp(E), #transExps(Es)
rule #transExps(.ExpTys) => .ExpCLs


rule #transExp(#expTyCase) => clskip
rule #transExp(#expTyIf) => clskip


syntax Map
       ::= "#exps2Map" "(" ExpTys ";" Int ")"			[function]

rule #exps2Map(#expTy(E:Exp,_:CoreTy),Es:ExpTys;I:Int) => (I |-> #moveVal(#transExp(E),#transExp(E))) #exps2Map(Es;I +Int 1)

rule #exps2Map(.ExpTys;_:Int) => .Map


rule #transExp(#rallocate(T ; Es:ExpTys))
     		    => #AllocateInit(valcl(#sizeofExps(Es)),T,#transExpMove(Es))

rule #transExp(#prefixSum(#rallocate(T ; Es:ExpTys))) 
                    => #AllocateInit(valcl(#sizeofExps(Es)),T,#transExpMove(Es))

rule #transExp(heap::allocate(#expTy(E,i32),T:CoreTy)) => #Allocate(#transExp(E),#raw(T))

syntax ExpCLs
       ::= #transExpMove(ExpTys)		[function]

rule #transExpMove(#expTy(E,T), Es:ExpTys)
     				=> #isMove(#transExp(E),T), #transExpMove(Es)

rule #transExpMove(.ExpTys) => .ExpCLs


rule #getId(I:Int) => var(I)

rule #getIds(.Idents, _) => .Idents
rule #getIds(X:Ident, Rest:Idents, R:Map) =>
     		     #getId(R[X]), #getIds(Rest,R)


syntax ExpCL
       ::= #unwrapExpCL(K)			[function]

syntax Exp
       ::= #unwrapExp(K)				[function]

syntax Idents
       ::= unwrapIds(K)			[function]

//rule unwrapExp(letcl A =cl B incl C) => letcl A =cl B incl C
rule #unwrapExp(E:Exp) => E

rule unwrapIds(Ps:Idents) => Ps

rule #unwrapExpCL(E:ExpCL) => E

rule <k> #texpStmtItem => . ... </k>
     <tstack>
	ListItem(#expTy(E:Exp,_)) => ListItem(#transExp(E);cl clskip) ...
     </tstack>

rule <k> #tvalStmtItem => . ... </k>
     <tstack>
	ListItem(#expTy(E:Exp,T:CoreTy)) => ListItem(#isMove(#transExp(E),T)) ...
     </tstack>
     <cpable> CS:Set </cpable>



rule <k> #tReturnItem => . ... </k>
     <tstack>
	ListItem(#expTy(E:Exp,T)) => ListItem(#retcl (#isMove(#transExp(E),T))) ...
     </tstack>
     <cpable> M:Set </cpable>


/*********************************************************

This rule is for translating assign statements:

Here we need to consider two cases:

(1) memory writing to stack
(2) memory writing to heap

In addition, In core-language, we don't have "&" operator.



**********************************************************/
rule <k> #tassignItem => . ... </k>
     <tstack>
	( ListItem(#expTy(L:Exp,T:CoreTy))
	  ListItem(#expTy(R:Exp,T1:CoreTy))
	  ListItem(#tassignstart)
	) => ListItem(tranAssignCL(#expTy(L,T),#isMove(#transExp(R),T1)))
	...
     </tstack>
     <cpable> CS:Set </cpable>

rule <k> #tassignItem =>  . ... </k> 
     <tstack>
	(ListItem(E1:Exp)
	 ListItem(#expTy(#expTyCase,T:CoreTy))
	 ListItem(E:ExpCL))
	 ListItem(#tassignstart)=>
     	 ListItem(tranAssignCL(E1,#isMove(E,T))) ... </tstack>
     <cpable> CS:Set </cpable>

rule <k> #tassignItem => . ... </k> 
     <tstack>
	(ListItem(E1:Exp)
	 ListItem(#expTy(#expTyIf,T:CoreTy))
	 ListItem(E:ExpCL)
	 ListItem(#tassignstart)) =>
     	 ListItem(tranAssignCL(E1, #isMove(E,T))) ... </tstack>
	 <cpable> CS:Set </cpable>


rule <k> #tassignItem =>  . ... </k> 
     <tstack>
	(ListItem(#expTy(var(I:Int),_))
	 ListItem(#expTy(funId(_:Int),T:CoreTy))
	 ListItem(E:ExpCL)
	 ListItem(#envitem(E1:ExpCL))
	 ListItem(#tassignstart)) =>
     	 ListItem(var(I) :=cl #AllocateInitRaw(valcl(2),T,E1,E))
	        ... </tstack>
     <cpable> CS:Set </cpable>



/********************************

*********************************/

syntax ExpCL
       ::= tranAssign(Exp,Exp)				[function]
         | tranAssignCL(Exp,ExpCL)			[function]

rule tranAssignCL(#expTy(var(I:Int),_), E:ExpCL) =>
     		#transExp(var(I)) :=cl E

rule tranAssignCL(#expTy(cvar(E1,I),_), E:ExpCL) =>
     		#transExp(cvar(E1,I)) :=cl sc E

rule tranAssignCL(#expTy(* L:Exp,_), E:ExpCL) =>
     		#transExp(* L) :=cl sc E

rule tranAssignCL(#expTy(E1:Exp . E2:Exp, _), E:ExpCL) =>
     	        #transExp(E1 . E2) :=cl sc E

rule tranAssignCL(#expTy(#RIndex(E1:Exp,E2:Exp), _), E:ExpCL) =>
     	        #transExp(#RIndex(E1,E2)) :=cl sc E


rule tranAssign(#expTy(E:Exp,T), #expTy(E1:Exp,_)) => tranAssignCL(#expTy(E,T), #transExp(E1))




syntax ExpCL
       ::= seqcomb(ExpCL,ExpCL)					[function]


rule seqcomb(letcl X =cl E1 incl E2, E3:ExpCL) => letcl X =cl E1 incl (seqcomb(E2,E3))

rule seqcomb(clskip, E:ExpCL) => E

rule seqcomb(E1 :=cl sc E2, E:ExpCL) => E1 :=cl sc E2 ;cl E

rule seqcomb(E1 ;cl E2, E) => E1 ;cl seqcomb(E2, E)

rule seqcomb(#move(E:ExpCL), E1:ExpCL) => #move(E) ;cl E1

rule seqcomb(E:ArithExpCL, E1:ExpCL) => E ;cl E1 

rule seqcomb(E:ValueCL, E1:ExpCL) => E ;cl E1 

rule seqcomb(callcl(E:ExpCL, Es:ExpCLs), E1:ExpCL) => callcl(E,Es) ;cl E1

rule seqcomb( #drop(E:ExpCL), E1:ExpCL) => E1 ;cl #drop(E)

rule seqcomb((| B |), E) => (| B |) ;cl E



/**********************************************************
	Translation of pattern matching
**********************************************************/


rule <k> #tmatch(Gs:GuardedActions) => #pushTerm(#casecl2(Gs)) ... </k>
     <tstack>
	ListItem(#tmatchbegin) => .List
	...
     </tstack>

rule <k> #tmatch(Gs:GuardedActions) => #tmatch(#guardedActions(G,Gs)) ... </k>
     <tstack>
	ListItem(G:GuardedAction) => .List
	...
     </tstack>


endmodule


