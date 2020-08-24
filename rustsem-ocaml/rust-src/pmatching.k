

module PMATCHING

imports SRUST-SYNTAX
imports CONFIGURATION
imports SORTINDEX
imports TRANSLATION
imports LIB

syntax Stmt
       ::= #pmatch(Exp,Arms)		
         | #pmatch1(Exp,Arms)
         | #parm(Exp,Exp,Arm)		[strict(1)]
	 | #tarm(KItem,KItem)			[strict]
	 | #tarmb(KItem,KItem)			[strict]

syntax Exp
       ::= #calTmp(K)			[function]

rule #calTmp(#expTy(E:Exp, #ref(T))) => #calTmp(#expTy(* E, T))
rule #calTmp(#expTy(E:Exp, T:CoreTy)) => #expTy(E,T)
     requires (sortIndex(T) =/=Int 4)

syntax Blocks
       ::= #tranSumMatch(CoreTy,Arms)		[function]


rule match E:Exp { As:Arms } => { #pmatch(E,As) }


rule <k> #pmatch(E:Exp, As:Arms)
     	=> #pushTerm(#tmatchbegin) ~> #pmatch1(E,As) @-> #tmatch(.GuardedActions)  ... </k>

rule <k> #pmatch1(E, A:Arm, As:Arms)
     	 		      => { #parm(E, E, A) } ~> #pmatch1(E,As) ...  </k>
     requires As =/=K .Arms

rule <k> #pmatch1(E, A:Arm, .Arms)
     	 		      => #CaseExpTy(#parm(E,E, A))  ...  </k>

rule #expTy(_:Exp,_:CoreTy) ~> #pmatch1(E,As) => #pmatch1(E,As)
rule #expTy((#), #void) ~> #pmatch1(E,As) => #pmatch1(E,As)

//rule #pmatch1(_,_,.Arms) =>

syntax SumTyItem
       ::= #addCaseTy(Exp,Pattern)

syntax Block
       ::= #unwrapBlock(K)		[function]

rule #unwrapBlock(B:Block) => B



rule <k> #parm(#expTy(_:Exp,#owner(#IdTy(T:Id, #prod(Cs:Fields)))),
                 E:Exp, #armExp(P:Pattern,E1:Exp))
     	 		=> #tarmb(#getGuard(P, E, #IdTy(T,#prod(Cs))),
			   #matchBody(#extractSubElems(E,P, Cs),E1)) ...  </k>

rule <k> #parm(#expTy(_:Exp,#owner(#IdTy(T:Id, #prod(Cs:Fields)))), E:Exp,
     	 		#armBlock(P:Pattern, B1:Block))
     	 		=> #tarmb(#getGuard(P, E, #IdTy(T,#prod(Cs))),
			   #matchBody(#extractSubElems(E,P,Cs),B1)) ...  </k>


/*
rule <k> #addCaseTy(#expTy(E:Exp,_:CoreTy), T:Ident {_:IdVals}) => . ... </k>
     <vInfo> .Map => (E. 1 |-> varInfo(E. 1, #owner(#prodId(T)),L)) ... </vInfo>
     <currentLft> L:Int </currentLft>
*/

rule <k> #addCaseTy(#expTy(E:Exp,_:CoreTy), T:Ident (_:IdVals)) => . ... </k>
     <vInfo> Rho:Map => Rho[E. 1 <- varInfo(E. 1, #owner(TP),L)] </vInfo>
     <typeCtx> ... T |-> TP:CoreTy ... </typeCtx>
     <currentLft> L:Int </currentLft>

rule <k> #addCaseTy(#expTy(E:Exp,_:CoreTy), T:Ident {_:IdVals}) => . ... </k>
     <vInfo> Rho:Map => Rho[E. 1 <- varInfo(E. 1, #owner(TP),L)] </vInfo>
     <typeCtx> ... T |-> TP:CoreTy ... </typeCtx>
     <currentLft> L:Int </currentLft>


rule <k> #addCaseTy(#expTy(E:Exp,_:CoreTy), T:Ident) => . ... </k>
     <vInfo> Rho:Map => Rho[E. 1 <- varInfo(E. 1, #owner(TP),L)] </vInfo>
     <typeCtx> ... T |-> TP:CoreTy ... </typeCtx>
     <currentLft> L:Int </currentLft>



rule <k> #parm(#expTy(E2:Exp,#owner(#IdTy(T:Id, #sum(Cs:Fields)))), E:Exp,
                                  #armExp(P:Pattern,E1:Exp))
     	 		=>  #addCaseTy(#expTy(E2,#IdTy(T:Id, #owner(#sum(Cs)))), P)
			   ~> #tarmb(#getGuardSum(T, P, E, Cs),
			   #matchBody(#extractSubElems(#field(E,1),P,Cs),E1)) ...  </k>


rule <k> #parm(#expTy(E2:Exp,#owner(#IdTy(T:Id, #sum(Cs:Fields)))), E:Exp,
                                  #armBlock(P:Pattern,B1:Block))
     	 	=>  #addCaseTy(#expTy(E2,#owner(#IdTy(T:Id, #sum(Cs:Fields)))), P)
		    ~> #tarmb(#getGuardSum(T, P, E, Cs),
		    #matchBody(#extractSubElems(#field(E,1),P,Cs),B1)) ...  </k>


rule <k> #parm(#expTy(E2:Exp, i32), E:Exp, #armBlock(P:Pattern,B1:Block)) =>
     	     #tarmb(#getGuardS(E,P),
	     #matchBody(#extractSubElems(E,P,.Fields),B1))
	      ... </k>

rule <k> #parm(#expTy(E2:Exp, i32), E:Exp, #armExp(P:Pattern, E1:Exp)) =>
     	     #tarmb(#getGuardS(E,P),
	     #matchBody(#extractSubElems(E,P,.Fields),E1))
	      ... </k>

rule <k> #parm(#expTy(E2:Exp, bool), E:Exp, #armBlock(P:Pattern, B1:Block)) =>
     	     #tarmb(#getGuardS(E,P),
	     #matchBody(#extractSubElems(E,P, .Fields),B1))
	      ... </k>

rule <k> #parm(#expTy(E2:Exp, bool), E:Exp, #armExp(P:Pattern, E1:Exp)) =>
     	     #tarmb(#getGuardS(E,P),
	     #matchBody(#extractSubElems(E,P, .Fields),E1))
	      ... </k>



syntax Exp
       ::= #getGuard(Pattern,Exp,CoreTy)			        [function]
         | #getGuard1(Pattern,Exp,Int)					[function]
         | #getGuardSum(Ident,Pattern,Exp,Fields)			[function]
	 | #getGuardS(Exp,Pattern)					[function]

rule #getGuardS(E:Exp,I:Int) => E == I

rule #getGuardS(E:Exp,default) => true

rule #getGuardS(E:Exp,B:Bool) => E == B

rule #getGuard(T:Ident {X : E:Exp, IVs:IdVals}, E1:Exp, #IdTy(T,#prod(Fs:Fields)))
     		       	  => ((E1).(#getIndexof(Fs,X)) == E)
     		       	  && #getGuard(T {IVs}, E1, #IdTy(T,#prod(Fs:Fields)))

rule #getGuard(T:Ident {mut X : E:Exp, IVs:IdVals}, E1:Exp, #IdTy(T,#prod(Fs:Fields)))
     		       	  => ((E1).(#getIndexof(Fs,X)) == E)
     		       	  && #getGuard(T {IVs}, E1, #IdTy(T,#prod(Fs:Fields)))


rule #getGuard(T:Ident {X:Id, IVs:IdVals}, E1:Exp, R:CoreTy)
     		       	      => true && #getGuard(T{IVs}, E1, R)

rule #getGuard(T:Ident {mut X:Id, IVs:IdVals}, E1:Exp, R:CoreTy)
     		       	      => true && #getGuard(T{IVs}, E1, R)


rule #getGuard(T:Ident {ref X:Id, IVs:IdVals}, E1:Exp, R:CoreTy)
     		       	      => true && #getGuard(T{IVs}, E1,R)

rule #getGuard(default, E:Exp, R:CoreTy) => true
			      
rule #getGuard(T:Ident {ref mut X:Id, IVs:IdVals}, E1:Exp, R:CoreTy)
     		       	      => true && #getGuard(T{IVs}, E1,R)

rule #getGuard(T:Ident (IVs:IdVals), E1:Exp, R:CoreTy)
     		       	      => #getGuard1(T(IVs),E1,0)

rule #getGuard1(T:Ident (X:Id : E:Exp, IVs:IdVals), E1:Exp, R:Int) => ((E1). R == E)
     		       	  && #getGuard1(T (IVs), E1, R +Int 1)

rule #getGuard1(T:Ident (X:Id, IVs:IdVals), E1:Exp, R:Int) => true


rule #getGuard(T:Ident {.IdVals}, E1:Exp, R:CoreTy) => true

rule #getGuard1(T:Ident (.IdVals), E1:Exp, R:Int) => true

rule #getGuardSum(T1:Ident, T:Ident {IVs:IdVals}, E1:Exp, Fs:Fields)
     			    => (#field(E1,0) == #getIndexof(Fs,T))
			         && #getGuard(T {IVs},#field(E1,1), #getTyof(Fs,T))

rule #getGuardSum(T1:Ident, T:Ident (IVs:IdVals), E1:Exp, Fs:Fields)
     			    => (#field(E1,0) == #getIndexof(Fs,T))
			         && #getGuard(T (IVs),#field(E1,1),  #getTyof(Fs,T))

rule #getGuardSum(T1:Ident, T:Ident, E1:Exp, Fs:Fields)
     			    => (#field(E1,0) == #getIndexof(Fs,T))


syntax Block
       ::= #matchBody(Map,K)     [function]

rule #matchBody((X:Ident |-> E1:Exp) M:Map, E:Exp) => #matchBody(M, {let X = E1 ; val(E)})

rule #matchBody((X:Ident |-> E1:Exp) M:Map, {Ss:Stmts}) => #matchBody(M, { let X = E1 ; Ss })

rule #matchBody(M:Map, {Ss:Stmts E:Exp}) => #matchBody(M, {#ExpStmts2Stmts(Ss,E)})

rule #matchBody((X:Ident |-> E1:Exp) M:Map, {Ss:Stmts})
     		   => #matchBody(M, { let X = E1; Ss})

rule #matchBody((true |-> E:Exp) M:Map, E:Exp) => #matchBody(M,E)
rule #matchBody((true |-> E:Exp) M:Map, {Ss:Stmts}) => #matchBody(M, { Ss })
rule #matchBody((true |-> E:Exp) M:Map, {Ss:Stmts E:Exp}) => #matchBody(M, {#ExpStmts2Stmts(Ss,E)})

rule #matchBody((false |-> E:Exp) M:Map, E:Exp) => #matchBody(M,E)
rule #matchBody((false |-> E:Exp) M:Map, {Ss:Stmts}) => #matchBody(M, { Ss })
rule #matchBody((false |-> E:Exp) M:Map, {Ss:Stmts E:Exp}) => #matchBody(M, {#ExpStmts2Stmts(Ss,E)})


rule #matchBody(.Map, E:Exp) => {val(E)}

rule #matchBody(.Map, B:Block) => B

rule unwrapInt(I:Int) => I

syntax Map
       ::= #extractSubElems(Exp, Pattern, Fields)		[function]
         | #extractSubElems1(Exp, Pattern, Int)		[function]

rule #extractSubElems(E:Exp, I:Int, M:Fields) => (E |-> I)
rule #extractSubElems(E:Exp, I:Bool, M:Fields) => (E |-> I)

rule #extractSubElems(E:Exp, T:Ident {X:Id, IVs:IdVals}, Fs:Fields)
     			     => (X |-> E.#getIndexof(Fs,X) #extractSubElems(E, T{IVs}, Fs))

rule #extractSubElems(E:Exp, T:Ident {mut X:Id, IVs:IdVals}, Fs:Fields)
     			     => (X |-> E.#getIndexof(Fs,X) #extractSubElems(E, T{IVs}, Fs))


rule #extractSubElems(E:Exp, T:Ident {ref X:Id, IVs:IdVals}, Fs:Fields)
     			     => (X |-> (& imm E.#getIndexof(Fs,X)) #extractSubElems(E, T{IVs},Fs))

rule #extractSubElems(E:Exp, T:Ident {ref mut X:Id, IVs:IdVals}, Fs:Fields)
     			     => (X |-> (& mut E.#getIndexof(Fs,X)) #extractSubElems(E, T{IVs},Fs))


rule #extractSubElems(E:Exp, T:Ident {X:Id : E1:Exp, IVs:IdVals}, Fs:Fields)
     			     	     => (X |-> E1) #extractSubElems(E, T{IVs}, Fs) 

rule #extractSubElems(E:Exp, T:Ident {mut X:Id : E1:Exp, IVs:IdVals}, Fs:Fields)
     			     	     => (X |-> E1) #extractSubElems(E, T{IVs}, Fs) 


rule #extractSubElems(E:Exp, T:Ident{.IdVals}, Fs:Fields) => .Map


/*********************************************************************/
rule #extractSubElems(E:Exp, T:Ident (IVs:IdVals), M:Fields) => #extractSubElems1(E, T(IVs), 0)

rule #extractSubElems1(E:Exp, T:Ident (X:Id, IVs:IdVals), M:Int)
     			             => (X |-> E. M) #extractSubElems1(E, T(IVs),M +Int 1)

rule #extractSubElems1(E:Exp, T:Ident (ref X:Id, IVs:IdVals), M:Int)
     			             => (X |-> (& imm E. M)) #extractSubElems1(E, T(IVs),M +Int 1)

rule #extractSubElems1(E:Exp, T:Ident (ref mut X:Id, IVs:IdVals), M:Int)
     			             => (X |-> (& mut E. M)) #extractSubElems1(E, T(IVs), M +Int 1)


rule #extractSubElems1(E:Exp, T:Ident (X:Id : E1:Exp, IVs:IdVals), M:Int)
     			     	     => (X |-> E1) #extractSubElems1(E, T(IVs), M +Int 1) 

rule #extractSubElems1(E:Exp, T:Ident(.IdVals), M:Int) => .Map


/*******************************************************/

rule #extractSubElems(E:Exp, T:Ident, M:Fields) => .Map

rule #extractSubElems(E:Exp, default, M:Fields) => .Map




syntax K
       ::= #substitude(Map, K)			[function]



syntax Exps
       ::= #substitudes(Map, Exps)			[function]



rule #substitude(_:Map, I:Int) => I
rule #substitude(_:Map, I:Bool) => I

rule #substitude(M:Map, X:Ident) => M[X]
     requires X in keys(M)

rule #substitude(M:Map, X:Ident) => X
     requires notBool (X in keys(M))

rule #substitude(M:Map, E1:Exp . E2:Exp) => #unwrapExp(#substitude(M,E1)) . #unwrapExp(#substitude(M,E2))
rule #substitude(M:Map, E1:Exp == E2:Exp) => #unwrapExp(#substitude(M,E1)) == #unwrapExp(#substitude(M,E2))

rule #substitude(M:Map, E:Exp (Es:Exps)) => #unwrapExp(#substitude(M,E)) (#unwrapExps(#substitudes(M,Es)))

rule #substitude(M:Map, * E:Exp) => * #unwrapExp(#substitude(M,E))

rule #substitude(M:Map, (#)) => (#)

rule #substitudes(M:Map, E:Exp, Es:Exps) => #unwrapExp(#substitude(M,E)), #unwrapExps(#substitudes(M,Es))
rule #substitudes(M:Map,.Exps) => .Exps

rule #substitude(M:Map, { Ss:Stmts }) => { #unwrapStmts(#substitude(M,Ss)) }

rule #substitude(M:Map, assert!(E:Exp);) => assert!(#unwrapExp(#substitude(M,E)));

rule #substitude(M:Map, S:Stmt Ss:Stmts) => #unwrapStmt(#substitude(M,S)) #unwrapStmts(#substitude(M,Ss))

rule #substitude(M:Map, .Stmts) => .Stmts

rule #substitude(M:Map, & mut E:Exp) => & mut #unwrapExp(#substitude(M,E))
rule #substitude(M:Map, & imm E:Exp) => & imm #unwrapExp(#substitude(M,E))

rule #substitude(M:Map, E1:Exp + E2:Exp) => #unwrapExp(#substitude(M,E1)) + #unwrapExp(#substitude(M,E2))

rule #substitude(M:Map, println!(S:String,Es:Exps);) => println!(S,#unwrapExps(#substitudes(M,Es)));
rule #substitude(M:Map, println!(S:String);) => println!(S);

syntax Exps
       ::= #unwrapExps(K)	[function]

syntax Stmt
       ::= #unwrapStmt(K)	[function]

syntax Stmts
       ::= #unwrapStmts(K)	[function]

rule #unwrapExps(Es:Exps) => Es
rule #unwrapStmt(S:Stmt) => S
rule #unwrapStmts(Ss:Stmts) => Ss




rule #tarm(#expTy(E1:Exp,_:CoreTy), #expTy(E2:Exp,T:CoreTy)) =>
         #pushTerm(#transExp(E1) ~> #transExp(E2)) ~> #expTy(E2,T)

rule <k> #tarmb(#expTy(E1:Exp,_:CoreTy), #expTy((#), #void)) =>
         #pushTerm(#transExp(E1) -> E) ~> #expTy((#), #void) ... </k>
     <tstack>
	ListItem(E:ExpCL) => .List
	...
     </tstack>


rule <k> #tarmb(#expTy(E1:Exp,_:CoreTy), #expTy(E2:Exp,T:CoreTy)) =>
         #pushTerm(#transExp(E1) -> E) ~> #expTy(E2,T) ... </k>
     <tstack>
	ListItem(E:ExpCL) => .List
	...
     </tstack>



endmodule
