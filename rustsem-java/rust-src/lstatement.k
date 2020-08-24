
require "tydef.k"
require "srust-syntax.k"
require "lexpression.k"
require "translation.k"
require "lib.k"

module LSTATEMENT

imports TYDEF
imports SRUST-SYNTAX
imports LEXPRESSION
imports TRANSLATION
imports LIB



/*******************************************
	The decompostion of statements
********************************************/

//First step

rule S:Stmt Ss:Stmts => S ~> Ss


//Second step

rule #void ~> Ss:Stmts => Ss
     requires Ss =/=K .Stmts

rule T:CoreTy ~> .Stmts => T

rule #expTy(E:Exp,T:CoreTy) ~> .Stmts  => #expTy(E,T)

rule .Stmts => #pushTerm(clskip) ~> #expTy((#), #void)

rule val(#expTy(E:Exp,T:CoreTy))
		=> #pushTerm(#expTy(E,T)) ~> #tvalStmtItem ~> #expTy(E,T)
     requires E =/=K #expTyIf andBool E =/=K #expTyCase
		
rule val((#)) => .

rule panic!(#expTy(E:Exp,T:CoreTy)); => #pushTerm(#expTy(E,T)) ~> #tpanic ~> #expTy((#),#void)
rule panic!(); => panic!("panic") ;

rule val(#expTy(#expTyIf,T:CoreTy))
		=> #expTy(#expTyIf,T)

rule val(#expTy(#expTyCase,T:CoreTy))
		=> #expTy(#expTyCase,T)

rule assert_eq!(E1:Exp, E2:Exp) ; => assert!(E1 == E2) ;
rule assert!(#expTy(E:Exp,_:CoreTy)) ; => #pushTerm(assertcl(#transExp(E))) ~> #expTy((#),#void)
//rule #move(#expTy(E:Exp,_:CoreTy)) ; => #pushTerm(#uninitialized(#transExp(E))) ~> #void

rule #memReferto(#expTy(E1:Exp,_:CoreTy), #expTy(E2:Exp,_:CoreTy)) 
     					=> #pushTerm(#referto(#transExp(E1),#transExp(E2))) ~> #void

rule println!(S:String, Es:ExpTys) ; => #pushTerm(#print(S,#transExps(Es))) ~> #expTy((#),#void)
rule println!(S:String) ; => #pushTerm(#print(S,.ValueCLs)) ~> #expTy((#), #void)

//-------------Loop--------------

rule loop B:Block => B ~>  #tloop

rule break ; => #pushTerm(#break) ~> #expTy((#), #void)

rule _Rust_await(#expTy(E:Exp,_)) ; => #pushTerm(#wait(#transExp(E))) ~> #expTy((#),#void) 

rule while E:ExpTy B:Block => #pushTerm(E) ~> B ~> #twhile

//----------end of loop----------

syntax TyCKItem
       ::= processLR(KItem,KItem)	[strict(1)]
         | #processLR(KItem,KItem)	[strict(2)]
         | #plhs(Ident, Mut, CoreTy)
	 | #letbindTy(Ident, CoreTy)
	 | #letbindTyInit(Ident, CoreTy, Exp)

rule #plhs(X:Ident, M:Mut, T:CoreTy) => #createVar(X,M,T) ~> X

rule let X:Ident = R:Exp ; => let imm X = R ;

rule <k> let X:Ident : T:RSType = R:Exp ; => #letbindTyInit(X, #RStoCT(T,Rho), R) ... </k>
     <typeCtx> Rho:Map </typeCtx>

rule <k> let M X:Ident : T:RSType = R:Exp ; => #letbindTyInit(X,#RStoCT(T,Rho), R) ... </k>
     <typeCtx> Rho:Map </typeCtx>

rule let X:Ident ; => let imm X;

rule <k> let X:Ident : T:RSType ; => #letbindTy(X, #RStoCT(T,Rho)) ... </k>
     <typeCtx> Rho:Map </typeCtx>

rule <k> let M X:Ident : T:RSType  ; => #letbindTy(X, #RStoCT(T,Rho)) ... </k>
     <typeCtx> Rho:Map </typeCtx>

rule [Binding-Decompose1]:
     <k> let M X:Ident = R:Exp ; =>
             #pushTerm(#tbindstart) ~> #processLR(#plhs(X,M,#TyUndef),R)
	        ~> #tbindItem ~> #expTy((#), #void) ... </k>

rule [Binding-Decompose]:
     let M X:Ident ; =>
        #pushTerm(#tbindstart) ~> #processLR(#plhs(X,M,#TyUndef),#expTy(#Undef_Value, #TyUndef)) ~> #tbindItem ~> #expTy((#), #void)

rule #letbindTy(X, T:CoreTy) =>
        #pushTerm(#tbindstart) ~> #processLR(#plhs(X,imm,T),#expTy(#Undef_Value, T))
	    ~> #tbindItem ~> #expTy((#), #void)

rule #letbindTyInit(X, T:CoreTy, R:Exp) =>
        #pushTerm(#tbindstart) ~> #processLR(#plhs(X,imm,T),R)
	    ~> #tbindItem ~> #expTy((#), #void)



rule #processLR(E:KItem, R:ExpTy) => processLR(E,R) 

rule [Assignment-Decompose]:
     L:Exp = R:Exp =>
                 #pushTerm(#tassignstart) ~>
		    #processLR(L, R) ~> #tassignItem ~> #expTy((#), #void)

rule [ProcessLR-Decompose]:
     <k> processLR(L:ExpTy,R:ExpTy) => #pushTerms(R,L)~> #updateL(L,R) ... </k>


/**********************************************************************
	             This rule is not complete.
	Return should jump out the control of the whole function
***********************************************************************/

rule return #expTy(E:Exp,T:CoreTy) ; => #pushTerm(#expTy(E,T)) ~> #tReturnItem
     	    			   ~> #expTy((#),#void)

rule return ; => return (#) ;

/***********************************************************@
	The decomposition of assignment for sum type
************************************************************/

syntax TyCKItem
       ::= processAssignSum(KItem,Int,KItem)	[strict(1,3)]

rule L:Exp =inj I:Int R:Exp =>  processAssignSum(lhs(L),I,R) 


rule [decompose-assign-sum]:
     <k> processAssignSum(
			#lhsTy(L:Exp,#owner(#IdTy(T1:Ident, #sum(Cs:Fields)))),
			I:Int,
			R:ExpTy
		     )  => #pushTerm(#tassignstart) ~>
		     	    processLR(#lhsTy(cvar(L,0),i32),#expTy(I,i32))
			    ~> #tassignItem ~> #pushTerm(#tassignstart) 
		     	~> processLR(#lhsTy(cvar(L,1),#getTyAt(Cs,I)),R)
			~> #tassignItem ~> #void ... 
     </k>



rule [eval-statement2]:
     #expTy(E,T:CoreTy) ; => #pushTerm(#expTy(E,T))
     				  ~> #texpStmtItem ~> #expTy(E,T)


rule #void ~> T:TransItems => T
rule #void ~> E:Exp => E
rule E:ExpTy ~> T:TransItems => T
rule E:ExpTy ~> Ss:Stmts => Ss
     requires Ss =/=K .Stmts
rule E:ExpTy ~> .Stmts => E


rule #Stop(S:String, Es:Exps) => println!(S,Es) ; panic!() ;



/*************************************************************************@
	           The decomposition of Branch
**************************************************************************/

syntax TyCKItem
       ::= twoBranchs(KItem,KItem)			[seqstrict]
         | processBranch(Map,K)
	 | combineBrwInfoWith1(Map)
	 | combineBrwInfoWith2(K,K)
	 | #transBranch(KItem)			[strict]

rule [decompose-ifr]:
     <k> if #expTy(E,bool) then B1:Block else B2:Block  =>
     	    #transBranch(B2) ~> #ifexpTy(B1) @-> #tifelseItem(E) ... </k>

rule [decompose-if]:
     <k> if #expTy(E,bool) B1:Block .ElseIfs else B2:Block  =>
     	    #transBranch(B2) ~> #ifexpTy(B1) @-> #tifelseItem(E) ... </k>

rule if E:Exp B1:Block else if E2 B2:Block EIF:ElseIfs else B3:Block => if E B1 .ElseIfs else { .Stmts if E2 B2 EIF else B3 }

rule if E:Exp B:Block => if E then B else {.Stmts}

rule #transBranch(E:ExpTy) => .
rule #transBranch(#void)    => .

rule twoBranchs(#expTy(_,T1:CoreTy),#expTy(E:Exp,T2:CoreTy)) => #expTy(E,T1) 
     requires sortIndex(T1) =/=Int 4

rule twoBranchs(#expTy(_,#ref(T)),#expTy(E:Exp,#ref(T))) =>
				#expTy(E,#ref(T)) 

rule twoBranchs(T1:CoreTy,T2:CoreTy) => T1 

rule twoBranchs(#ref(T),#ref(T)) => #ref(T)

/*
	The computation of the term "processBranch"
	is consists of three steps:
	1. compute the body E
	2. merge varInfo
	3. merge DG
*/

rule [decompose-branch]:
     <k> processBranch(R:Map,E) => E ~> combineBrwInfoWith1(Rho1) ... </k>
     <vInfo> Rho1:Map => R </vInfo>


rule combineBrwInfoWith1((R:Exp |-> V:VarInfo ) Rho:Map) =>
     	 			   combineBrwInfoWith2(R,V) ~> combineBrwInfoWith1(Rho)


rule <k> combineBrwInfoWith2(R:Exp, V) => . ...</k>
     <vInfo> (.Map => R |-> V) Rho:Map </vInfo>
     requires notBool (R in keys(Rho))

rule <k> combineBrwInfoWith2(R:Exp, varInfo(_,_,_)) => . ...</k>

rule combineBrwInfoWith1(.Map) => .


syntax TyCKItem
       ::= updateImmLabel(K,Int)
         | updateMutLabel(K,Int)
	 | updateMutandImmLabel(K)


/*@ The block has a type. Its type is the type of Ss.
    When a block is consumed.  
*/

rule { Ss:Stmts } => #newlft ~> #pushTerm(#tblockStart) ~> Ss @-> #tblockend ~> #endlft


rule #ExpStmts2Stmts(.Stmts, E:Exp) => #stmts(val(E),.Stmts)

rule #ExpStmts2Stmts(S:Stmt Ss:Stmts, E:Exp) => #stmts(S, #ExpStmts2Stmts(Ss,E))

rule { Ss:Stmts E:Exp } => { #ExpStmts2Stmts(Ss, E) }

//rule { Ss:Stmts} => Ss

rule T:CoreTy ~> #endlft => #endlft ~> T
rule #expTy(A,B) ~> #endlft => #endlft ~> #expTy(A,B)


/**********************************************
	Merge Borrowing Operation
*********************************************/
/*
syntax IntwithSpecialSym
       ::= minLifetime( IntwithSpecialSym,  IntwithSpecialSym)	[function]

rule minLifetime(L1:Int,L2:Int) => minLft(L1,L2)
rule minLifetime(L1:Lifetime,L2:Int) => L1
rule minLifetime(L1:Int,L2:Lftvar) => L2
*/




/************************************************
	The case semantics for sum types
************************************************/

syntax TyCKItem
       ::= #rmsumdata(K)

//"#caseItem" "(" Exp ";" Int ";" Int ";" Blocks ")"


/**********************************************

   This part is for case statement.
   Case statement is only for sum type.
   A variable of a sum type can be a value
   of different types.

   Just like pattern matching, the value
   of a sum type can be extracted in
   case statement.

   In our data structure, a variable X of sum type 
   has two fields:
   (1) X.1 : indicates the type of the sum type selects
   (2) X.2 : store the value of the selected type.

   X.2 can only be used in the blocks of case statements.
   The status of borrowing and initialization of X.2 inherits
   from X.

   In order to implement this, we define
   a new term #rmtmpvar.

   In addition, we define the term
   #caseItem as the intermediate term.

   Some problems:
   	if a variable of sumtype is bound
	to a reference type.


**********************************************/

syntax CaseItems
       ::= initCase(Exp,Int,Int)
         | execBranch(KItem,KItem,KItem)		[seqstrict]
	 | #rmelem(Exp)

rule <k> #rmelem(E:Exp) => #void ... </k>
     <vInfo> ... ((elem(E) |-> _) => .Map) ... </vInfo>

rule <k> #rmelem(E:Exp) => #void ... </k>
     <vInfo> Rho:Map </vInfo>
     requires notBool (elem(E) in keys(Rho))

rule execBranch(#void,#expTy(A,T:CoreTy),#void) => #expTy(A,T:CoreTy)
rule execBranch(#void,T:CoreTy,#void) => T

rule case E:ExpTy of {Bs:Blocks} =>
     	  	#pushTerm(#tcaseStart)  ~> #tcaseBlks(Bs) @-> #tcaseItem(E) 

/*
rule <k> #caseItem(R:Exp; C:Int ; N ; B:Block, Bs:Blocks)
     	 	=> twoBranchs(execBranch(initCase(R,N,C),B,#rmelem(R)),
		      processBranch(Rho1,#caseItem(R;C;N +Int 1;Bs))) ... </k>
     <vInfo> Rho1:Map  </vInfo>
     requires Bs =/=K .Blocks

rule <k> #caseItem(R:Exp; C:Int ; N:Int ; B:Block, .Blocks)
     	 	=> processBranch(Rho1,execBranch(initCase(R,N,C),B,#rmelem(R))) ... </k>
     <vInfo> Rho1:Map  </vInfo>
     <ctyId> C </ctyId>
     <cntElem> N </cntElem>


rule <k> #caseItem(_;C:Int;N:Int;.Blocks) => #void ... </k>
     <ctyId> C </ctyId>
     <cntElem> N -Int 1 </cntElem>



rule <k> initCase(E:Exp,I:Int,C:Int) => #void ... </k>
     <ctyId> C </ctyId>
     <ctyKind> 1 </ctyKind>
     <ctyElem> ... I |-> T:CoreTy ... </ctyElem>
     <vInfo> Rho:Map  (.Map => elem(E) |-> varInfo(E,T,L)) </vInfo>
     <currentLft> L:Int </currentLft>
     requires notBool (cvar(E,I) in keys(Rho))

rule <k> initCase(E:Exp,I:Int,C:Int) => #void ... </k>
     <vInfo>  (.Map => elem(E) |-> Rho[cvar(E,I)]) Rho:Map </vInfo>
     requires cvar(E,I) in keys(Rho)

*/

/*******************************************************/




endmodule



