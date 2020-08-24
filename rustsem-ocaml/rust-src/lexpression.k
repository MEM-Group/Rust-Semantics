

require "srust-syntax.k"
require	"tydef.k"
require "configuration.k"
require "core-function.k"
require "sortindex.k"
require "translation.k"
require "tydef.k"

module LEXPRESSION

imports SRUST-SYNTAX
imports TYDEF
imports CONFIGURATION
imports CORE-FUNCTION
imports SORTINDEX
imports TRANSLATION




/***** auxiliary syntax sorts *****/

syntax TyCKItem
       ::= #MoveR(K)
	 | #createVar(Ident,Mut,CoreTy)
	 | #updateL(K,K)


/***** rewrite rules for arithmatics *****/

rule (#) => #expTy((#),#void)

rule unsafe { Ss:Stmts} => Ss
rule unsafe { .Stmts E:Exp } => E
rule unsafe { S:Stmt Ss:Stmts E:Exp} => #ExpStmts2Stmts(Ss,E)

rule ( ) => (#)

rule R:Int => #expTy(R,i32)
rule R:Bool => #expTy(R,bool)
rule R:Float => #expTy(R,f32)
       
rule R:String => #expTy(R,#ref(#owner(str)))

rule (#expTy(R1:Exp,i32) * #expTy(R2:Exp,i32)) => #expTy(R1 * R2,i32)
	
rule #expTy(R1,i32) / #expTy(R2,i32) => #expTy(R1 / R2,i32)

rule E1:Exp % E2:Exp => E1 mod E2

rule <k> #expTy(R1,i32) + #expTy(R2,i32) => #expTy(R1 + R2,i32) ... </k>

rule <k> #expTy(R1,i32) ^ #expTy(R2,i32) => #expTy(R1 ^ R2,i32) ... </k>
     
rule <k> #expTy(R1,i32) - #expTy(R2,i32) => #expTy(R1 - R2,i32) ... </k>
     
rule <k>  #expTy(R1,_) <= #expTy(R2,_) => #expTy(R1 <= R2,bool) ... </k>
rule <k> #expTy(R1,i32) == #expTy(R2,i32) => #expTy(R1 == R2,bool) ... </k>
     
rule <k> #expTy(R1,i32) < #expTy(R2,i32) => #expTy(R1 < R2,bool) ... </k>
rule <k> #expTy(R1,i32) > #expTy(R2,i32) => #expTy(R1 > R2,bool) ... </k>
rule <k> #expTy(R1,i32) >= #expTy(R2,i32) => #expTy(R1 >= R2,bool) ... </k>
rule <k> #expTy(R1,i32) mod #expTy(R2,i32) => #expTy(R1 mod R2,bool) ... </k>
rule <k> #expTy(R1,bool) && #expTy(R2,bool) => #expTy(R1 && R2,bool) ... </k>
rule <k> #expTy(R1,bool) || #expTy(R2,bool) => #expTy(R1 || R2,bool) ... </k>
rule <k> #expTy(R1,Int) & #expTy(R2,Int)  => #expTy(R1 & R2, Int) ... </k>
rule #expTy(R1,_) + #expTy(R2,_) => #expTy(R1 + R2,i32)
rule #expTy(R1,_) - #expTy(R2,_) => #expTy(R1 - R2,i32) 
rule #expTy(R1,_) == #expTy(R2,_) => #expTy(R1 == R2,bool)
rule #expTy(R1,_) < #expTy(R2,_) => #expTy(R1 < R2,bool)
rule #expTy(R1,_) > #expTy(R2,_) => #expTy(R1 > R2,bool)
rule #expTy(R1,_) >= #expTy(R2,_) => #expTy(R1 >= R2,bool)
rule #expTy(R1,_) mod #expTy(R2,_) => #expTy(R1 mod R2,bool)


rule * self => * #selfX
rule self . E:Exp => #selfX . E


rule <k> #rallocate(T:CoreTy, #expTy(E:Exp,_:CoreTy)) => #expTy(#Heap(E,T), #owner(T)) ... </k>
     <currentLft> L:Int </currentLft>
     requires sortIndex(T) =/=Int 20

rule <k> #rallocate(T:CoreTy; Es:ExpTys) => #expTy(#rallocate(T;Es), #owner(T)) ... </k>
     <currentLft> L:Int </currentLft>
     requires sortIndex(T) =/=Int 20

rule <k> #rallocate(#raw(T:CoreTy), #expTy(E:Exp,_:CoreTy)) => #expTy(#Heap(E,T), #raw(T)) ... </k>
     <currentLft> L:Int </currentLft>

rule <k> #rallocate(#raw(T:CoreTy); Es:ExpTys) => #expTy(#rallocate(#raw(T); Es), #raw(T)) ... </k>
     <currentLft> L:Int </currentLft>

rule <k> #rallocate(TN:Ident, E:ExpTy) => #rallocate(T,E) ... </k>
     <typeCtx> ... TN |-> T:CoreTy  ...  </typeCtx>

rule <k> #rallocate(TN:Ident, E:ExpTy) => #rallocate(#ty(TN),E) ... </k>
     <typeCtx> Rho:Map </typeCtx>
     requires notBool (TN in keys(Rho))

rule <k> heap::allocate(#expTy(E:Exp,i32),T:RSType)
            => #expTy(heap::allocate(#expTy(E:Exp,i32),#RStoCT(T,M)), #raw(#RStoCT(T,M))) ... </k>
     <typeCtx> M:Map </typeCtx>


rule <k> #rawpt(#expTy(E,T:CoreTy)) => #expTy(#rawpt(E),#raw(T)) ... </k>

rule <k> X:Ident => #expTy(var(C),T) ...  </k>
     <tcenv> ... X |-> C:Int ... </tcenv>
     <vInfo> ... var(C) |-> varInfo(_,T:CoreTy,L) ... </vInfo>
     requires T =/=K #ref(#owner(str))

rule <k> X:Ident => #expTy((*var(C)). 0,#ref(#owner(str))) ...  </k>
     <tcenv> ... X |-> C:Int ... </tcenv>
     <vInfo> ... var(C) |-> varInfo(_,#ref(#owner(str)),L) ... </vInfo>

rule <k> #cast(#expTy(E,T), * mut T1) => #expTy(#rawpt(E),#RStoCT(* mut T1,Rho))  ... </k>
     <typeCtx> Rho:Map </typeCtx>

rule <k> #cast(#expTy(E,T), * const T1) => #expTy(#rawpt(E),#owner(#RStoCT(* const T1,Rho)))  ... </k>
     <typeCtx> Rho:Map </typeCtx>

rule #castSelf(T) => #cast(#selfX, T)




rule <k> elem(#expTy(E:Exp,_)) => #expTy(elem(E),T) ...  </k>
     <vInfo> ... elem(E) |-> varInfo(_,T:CoreTy,_) ... </vInfo>

/***** rewrite rules for #owner and ref types *****/


rule <k> & mut #expTy(V:Exp,T) => 
               #expTy(& mut V,#ref(T)) ...  </k>	      
     <currentLft> CL:Int </currentLft>

rule & E:Exp => & imm E

/*
rule <k> & imm #expTy(V:Exp,#owner(T)) =>  
               #expTy(& imm V,#ref(#owner(T)))  ...  </k>
     <currentLft> CL:Int </currentLft>
*/

rule <k> & mut #expTy(V:Exp,T:CoreTy) => 
               #expTy(& mut V,#ref(T))  ...  </k>
     <currentLft> CL:Int </currentLft>

rule <k> & imm #expTy(V:Exp,T:CoreTy) => 
               #expTy(& imm V,#ref(T)) ...  </k>
     <currentLft> CL:Int </currentLft>



rule * #expTy(V:Exp,#owner(T:CoreTy)) =>  #expTy(*V,T)

rule * #expTy(V:Exp,#ref(T:CoreTy)) =>  #expTy(*V,T)

rule * #expTy(V:Exp,#ref(T:CoreTy)) =>  #expTy(*V,T)
rule * #expTy(V:Exp,#raw(T:CoreTy)) =>  #expTy(*V,#raw(T))

//rule * #expTy(V:Exp,Box <T:CoreTy>) =>  #expTy(*V,T)

rule #lenStr(#expTy(E:Exp,#owner(str))) => #expTy(#lenStr(E),i32)

/**********************************************************@
	 The Computation for Composite Type
************************************************************/


rule #expTy(V:Exp,#owner(#IdTy(T:Ident, #prod(Cs:Fields)))) . J:Int
			=> #expTy(V . J, #getTyAt(Cs, J))

/************************************************************/



rule <k> #expTy(V:Exp, #owner(#IdTy(T:Ident,#prod(Cs:Fields)))) . D:Ident
     	 		=> #expTy(V.#getIndexof(Cs,D), #getTyof(Cs,D)) ... </k>
     requires #inFields(Cs,D) =/=Int 0
				 
     

syntax Exp
       ::= #rawpoint(Exp,Exp)	[strict(2)]

rule #expTy(E:Exp,#raw(T:CoreTy)) . I:Int => #rawpoint(#expTy(E,#raw(T)),I)

rule #expTy(V:Exp,#raw(#owner(#IdTy(T:Ident, #prod(Cs:Fields))))) . J:Int
			=> #expTy(V . J, #getTyAt(Cs, J))

rule <k> #expTy(V:Exp, #raw(#owner(#IdTy(T:Ident,#prod(Cs:Fields))))) . D:Ident
     	 		=> #expTy(V.#getIndexof(Cs,D), #getTyof(Cs,D)) ... </k>
     requires #inFields(Cs,D) =/=Int 0


rule #rawpoint(#expTy(E,#raw(T)), #expTy(E1,i32)) => #expTy(E. E1, #raw(T))


/*********************************************
		The evaluation for sumtype
**********************************************/


rule <k> #expTy(V,#owner(#IdTy(T,#sum(Cs:Fields)))). 1:Int => #expTy(cvar(V,1), T1) ... </k>
     <vInfo> ... V. 1 |-> varInfo(_,T1:CoreTy,_)  ... </vInfo>


rule <k> #expTy(V,#owner(#IdTy(T,#sum(Cs:Fields)))). 0:Int => #expTy(cvar(V,0), i32) ... </k>


rule <k> #expTy(E:Exp, T:CoreTy) . F:Id => #expTy(E . F, T) ... </k>
     <typeCtx> Rho:Map </typeCtx>
     requires (#cpath(#getOwnTy(T), F) in keys(Rho)) orBool (sortIndex(T) ==Int 17)

rule #cpath(#ref(T:CoreTy),F:Ident) => #cpath(T,F)


rule <k> T:Ident :: F:Ident =>
     	    #expTy(#cpath(#owner(#unwrapCoreTy(Rho[T])), F),
	    	 #unwrapCoreTy(Rho[#cpath(#owner(#unwrapCoreTy(Rho[T])), F)])) ... </k>
     <typeCtx> Rho:Map </typeCtx>
     requires (T in keys(Rho)) andBool (#cpath(#owner(#unwrapCoreTy(Rho[T])),F) in keys(Rho)) 


rule <k> T:Ident :: F:Ident =>
     	     #expTy(#prefixSum(#rallocate(#IdTy(T,#sum(Cs));
		#exptylist(#expTy(#getIndexof(Cs,F),i32),
     	 	 #exptylist(#expTy((#),#void), .ExpTys)))), #owner(#IdTy(T,#sum(Cs)))) ... </k>
     <typeCtx> ... T |-> #IdTy(T,#sum(Cs:Fields))  ...  </typeCtx>

     

rule <k> #funCall(#expTy(#prefixSum(#rallocate(#IdTy(T,#sum(Ts:Fields));
	#exptylist(#expTy(I:Int,i32), #exptylist(#expTy((#),#void), .ExpTys)))),
				      #owner(#IdTy(T,#sum(Ts)))), Es:ExpTys)
	 =>  #sumInitm(T,T,#rexplist(I,#rexplist(#prodInitm(#getTyAt(Ts,I),Es),.Exps))) ... </k>


rule #funCall(#expTy(#prefixfun(T:Ident :: F:Ident), RT:CoreTy), Es:ExpTys)
     					=>  call #cpath(RT,F) (Es)

rule <k> #funCall(#expTy(E:Exp.F:Id, T:CoreTy), Es:ExpTys) =>
     		  call #cpath(#getOwnTy(T),F) (#exptylist(#expTy(E,T),Es)) ... </k>
     <typeCtx> ... #cpath(#getOwnTy(T),F) |-> fnTy(Ts:CoreTys) -> _:CoreTy ... </typeCtx>
     requires (sortIndex(#getOwnTy(T)) =/=Int 17)
     	      	  andBool (#sizeofCoreTys(Ts) ==Int #sizeofExps(Es) +Int 1)

rule <k> #funCall(#expTy(E:Exp.F:Id, T:CoreTy), Es:ExpTys) =>
     		  call #cpath(#getOwnTy(T),F) (Es) ... </k>
     <typeCtx> ... #cpath(#getOwnTy(T),F) |-> fnTy(Ts:CoreTys) -> _:CoreTy ... </typeCtx>
     requires (sortIndex(#getOwnTy(T)) =/=Int 17) andBool (#sizeofCoreTys(Ts) ==Int #sizeofExps(Es))


rule <k> #funCall(#expTy(E:Exp . F:Id, T:CoreTy), Es:ExpTys) =>
     		  polycall #tpath(E, #getOwnTy(T), F) (#exptylist(#expTy(E,T),Es)) ... </k>
     <typeCtx> ... #cpath(#getOwnTy(T),F) |-> fnTy(Ts:CoreTys) -> _:CoreTy ... </typeCtx>
     requires (sortIndex(#getOwnTy(T)) ==Int 17)
     	      			   andBool (#sizeofCoreTys(Ts) ==Int #sizeofExps(Es) +Int 1)

rule <k> #funCall(#expTy(E:Exp . F:Id, T:CoreTy), Es:ExpTys) =>
     		  polycall #tpath(E, #getOwnTy(T), F) (Es) ... </k>
     <typeCtx> ... #cpath(#getOwnTy(T),F) |-> fnTy(Ts:CoreTys) -> _:CoreTy ... </typeCtx>
     requires (sortIndex(#getOwnTy(T)) ==Int 17) andBool (#sizeofCoreTys(Ts) ==Int #sizeofExps(Es))

rule <k> F:Ident => #expTy(F,fnTy(Ts) -> T) ... </k>
     <typeCtx> ... F |-> fnTy(Ts:CoreTys) -> T:CoreTy ...  </typeCtx>
     <tcenv> Rho:Map </tcenv>
     <funclosure> Rho1:Map </funclosure>
     requires (notBool (F in keys(Rho))) andBool (notBool (F in keys(Rho1)))

rule #funCall(#expTy(F:Ident, fnTy(Ts:CoreTys) -> T:CoreTy), Es:ExpTys) => call F (Es)

rule <k> #funCall(#expTy(F:Ident, #owner(#closureTy(#envId(ENV:Int),
     	 			  fnTy(Ts:CoreTys) -> RT:CoreTy))), Es:ExpTys)
       => #expTy(call (F . 1) (#exptylist(#expTy(F. 0, #unwrapCoreTy(M[#env(ENV)])), Es)), RT) ... </k>
     <typeCtx> M:Map </typeCtx>






rule lhs(* R:Exp) => * lhs(R)
rule lhs(& M:Mut R:Exp) => & M lhs(R)
rule lhs(R:Exp.I:Exp) => lhs(R).I
rule lhs(* self) => * lhs(#selfX)




rule <k> lhs(X:Ident) => #lhsTy(var(C),T) ...  </k>
     <tcenv> ... X |-> C:Int ... </tcenv>
     <vInfo> ... var(C) |-> varInfo(_,T:CoreTy,_) ... </vInfo>


rule <k> #lhsTy(V:Exp, #owner(#IdTy(T,#prod(Cs:Fields)))) . D:Ident
     	 	      => #lhsTy(V. #getIndexof(Cs,D),#getTyof(Cs,D)) ... </k>
     requires T =/=K String2Id("Vec")

syntax Exp
       ::= #lhsTyVec(ExpTy, Exp)	[strict(2)]


rule #lhsTy(V:Exp, #owner( #IdTy(TN, T:CoreTy) ) ) . E:Exp => #lhsTyVec( #lhsTy(V,#owner(#IdTy(TN, T))) , E)
     requires TN ==K String2Id("Vec")


rule <k> #lhsTy(V:VarId,#owner(#IdTy(T, #prod(Cs:Fields)))) . I:Int
     	 			=> #lhsTy(cvar(V,I),#getTyAt(Cs,I)) ... </k>
     requires T =/=K String2Id("Vec")

rule <k> #lhsTy(V:Exp,#owner(#IdTy(T,#prod(Cs:Fields)))) . I => #lhsTy(V.I,#getTyAt(Cs,I)) ... </k>
     requires T =/=K String2Id("Vec")

/*******************************************************/

rule <k> #lhsTy(V:VarId,#owner(#IdTy(T, #prod(Cs:Fields)))) . D:Ident
     	 		=> #lhsTy(cvar(V, #getIndexof(Cs,D)),#getTyof(Cs,D)) ... </k>
     requires T =/=K String2Id("Vec")


rule <k> #lhsTy(V:Exp,#owner(#IdTy(T, #prod(Cs:Fields)))) . D:Ident
     	 			    => #lhsTy(V.#getIndexof(Cs,D) , #getTyof(Cs,D)) ... </k>
          requires T =/=K String2Id("Vec")

/*
     <typeCtx> ... #prodId(T) |-> C:Int ... </typeCtx>
     <f2type>  ... T . D |-> J:Int ...  </f2type>
     <ctyId> C </ctyId>
     <ctyKind> 0  </ctyKind>	   
     <ctyElem> ... J |-> T1:CoreTy ...  </ctyElem>
     requires sortIndex(V) =/=Int 15
     */


/*******************************************************/


//rule lhsTy(V,#owner(tyArray(T,N:Int))).I => lhsTy(V.I,T)

rule #lhsTy(E:Exp,#raw(T:CoreTy)) . I:Int => #lhsTy(E . I, T)


rule  * #lhsTy(R,#owner(T)) => #lhsTy(*R,T)
rule  * #lhsTy(R,#ref(T)) => #lhsTy(* R,T) 
     


rule #MoveR(#expTy(#Heap(N:Int,T:CoreTy),#owner(T))) => .
rule #MoveR(#expTy(_,i32)) => .
rule #MoveR(#expTy(_,bool)) => .
rule #MoveR(#expTy(_,#ref(_))) => .


rule [#MoveR]:
     <k> #MoveR(#expTy(V, #owner(T:CoreTy))) => . ... </k>

rule [#MoveR]:
     <k> #MoveR(#expTy(V, #owner(T:CoreTy))) => . ... </k>

rule #MoveR(#expTy(call X:Id (Es:Exps),_)) => .
     
rule <k> #createVar(X:Ident, M:Mut, T:CoreTy) => .  ... </k>
     <varCnt> C:Int => C +Int 1 </varCnt>
     <vInfo> .Map => (var(C) |-> varInfo(X,T,L)) ... </vInfo>
     <tcenv> Rho:Map => Rho[X <- C] </tcenv>
     <currentLft> L:Int </currentLft>


syntax CompatibleCKItem
       ::= assignCptCK(CoreTy,CoreTy)

syntax TyCKItem
       ::= tyCKAssign(CoreTy,CoreTy)




/***********************************************@
         Binding a Exp to a variable
***********************************************/

rule #updateL(#expTy(E:Exp, _:CoreTy), #expTy(R:Exp, T:CoreTy)) => .
     requires sortIndex(E) =/=Int 15

rule <k> #updateL(#expTy(V:VarId, T1:CoreTy),#expTy(R,T:CoreTy)) => . ... </k>
     <vInfo>
	... V |-> varInfo(_, (#TyUndef => T), L:Int) ...
     </vInfo>



rule <k> #updateL(#expTy(V:VarId, T1:CoreTy),#expTy(R,T:CoreTy)) => . ... </k>
      requires T1 =/=K #TyUndef


rule <k> #updateL(#expTy(V:VarId,_),#expTy(R:Exp, T:CoreTy)) => . ... </k>
     <vInfo>
	(.Map => V |-> varInfo(V,T,L)) Rho:Map
     </vInfo>
     <currentLft> L:Int  </currentLft>
     requires (notBool (V in keys(Rho)))


/*
rule <k> updateL(lhsTy(V,T),#expTy(R,T:CoreTy)) => . ... </k>
     <currentLft> L:Int  </currentLft>
     requires sortIndex(V) =/=Int 15
*/


rule <k> #prodInit(N:Ident, Is:IdVals)
				=> #prodInitm(T, #extractExpsfromIdVals(Is)) ... </k>
     <typeCtx> ... N |-> T:CoreTy ...  </typeCtx>

syntax CoreTy
       ::= #InstantiateProd(CoreTy, ExpTys)		[function]

syntax Fields
       ::= #InstantiateFields(Fields, ExpTys)		[function]

syntax Field
       ::= #InstantiateField(Field, ExpTy)		[function]


syntax CoreTy
       ::= #InstantiateTy(CoreTy, CoreTy)		[function]




rule #InstantiateProd(#IdTy(N:Ident, #prod(Fs:Fields)), Es:ExpTys) =>
       			#IdTy(N, #prod(#InstantiateFields(Fs, Es)))


rule #InstantiateFields(#Fields(F:Field, Fs:Fields), #exptylist(E:ExpTy, Es:ExpTys)) =>
     	    #Fields(#InstantiateField(F,E), #InstantiateFields(Fs, Es))

rule #InstantiateFields(.Fields, .ExpTys) => .Fields


rule #InstantiateField(#fd(X:Ident, T:CoreTy), #expTy(_,T1:CoreTy)) =>
     				    #fd(X, #InstantiateTy(T,T1))

rule #InstantiateTy(i32, i32) => i32

rule #InstantiateTy(bool, bool) => bool

rule #InstantiateTy(#owner(T:CoreTy), #owner(T1:CoreTy))
     				    => #owner(#InstantiateTy(T,T1))

rule #InstantiateTy(#ref(T:CoreTy), #ref(T1:CoreTy))
                                    => #ref(#InstantiateTy(T,T1))

rule #InstantiateTy(#raw(T:CoreTy), #raw(T1:CoreTy)) => #raw(#InstantiateTy(T,T1))

rule #InstantiateTy(#ty(T), T1:CoreTy) => T1



rule <k> #prodInitm(#IdTy(N:Ident,T:CoreTy), Es:ExpTys)
		=> #expTy(#rallocate(#IdTy(N,T); Es), #owner(#IdTy(N,T))) ... </k>



syntax Exps
       ::= #extractExpsfromIdVals(IdVals)		[function]

rule #extractExpsfromIdVals(X:Ident : E:Exp, Is:IdVals) => E, #extractExpsfromIdVals(Is)
rule #extractExpsfromIdVals(.IdVals) => .Exps

syntax Exp
       ::= #sumInitm(Ident , Ident , Exps)			[strict(3)]

rule <k> T1:Ident :: T2:Ident {Is:IdVals} =>
     	 #sumInitm(T1,T2,
	 #rexplist(#getIndexof(Fs,T2),
	 #rexplist(#prodInitm(#getTyof(Fs,T2),#extractExpsfromIdVals(Is)), .Exps))) ... </k>
     <typeCtx> ... T1 |-> #IdTy(T1,#sum(Fs:Fields)) ... </typeCtx>


rule <k> #sumInitm(T1,T2,Es:ExpTys) =>
     	 	#expTy(#rallocate(#IdTy(T1, #sum(Cs)) ;Es),
		         #owner(#IdTy(T1, #sum(Cs)))) ... </k>
     <typeCtx> ... T1 |-> #IdTy(T1, #sum(Cs:Fields)) ... </typeCtx>


/***********************************************
		   threads
************************************************/


rule #spawn(#expTy(E:Exp,#ref(#owner(str))),#expTy(var(I:Int),T:CoreTy)) =>
     		#expTy(#expcl(#forkcl(#transExp((*E). 0), refcl(1, #transExp(var(I))))), i32)
     

rule .Exps => .ExpTys
rule #rexplist(E:ExpTy, Es:ExpTys) => #exptylist(E,Es)

/******************************************
   cast
********************************************/




endmodule


