	
require "tydef.k"
require "clang_op/clang-syntax.k"

module SRUST-SYNTAX

imports TYDEF
imports CLANG-SYNTAX
imports COLLECTIONS

syntax Rust
       ::= Decls


syntax Decls
       ::= List{Decl, ""}			[klabel(#Decls)]

syntax Decl
       ::= FunDeclC
         | TyDecl
	 | ImplTrait
	 | Trait
	 | Enum
	 | Struct
	 | TyMethodDecl


/*********************************************
	Function Declaration
*********************************************/

syntax FunDeclC
       ::= FunDecl
         | "pub" FunDecl

syntax FunDecl
       ::= "ifn" Ident "(" Idents ")" Block		[klabel(#FunDecl)]

syntax KResult
       ::= ExpTy
         | ExpTys

syntax VarInfo
       ::= varInfo(Exp, CoreTy, Int)


syntax FunDecl
       ::= "fn" Ident "<" GParams ">" "(" TypeIds ")" Block			[klabel(#funDecl1)]
         | "fn" Ident "(" TypeIds ")" Block					[klabel(#funDecl2)]
	 | "fn" Ident "<" GParams ">" "(" TypeIds ")" "->" RSType Block		[klabel(#funDec3 )]
         | "fn" Ident "(" TypeIds ")" "->" RSType Block			  	[klabel(#funDecl4)]
	 | "fn" Ident "(" TypeIds ")" "=fun" Exp				[klabel(#funDecl7)]
	 | "unsafe" FunDecl							


syntax Exp
       ::= #prefixfun(Exp)
         | #prefixSum(Exp)



syntax Id
       ::= "#tmp"


syntax Exp
       ::= Int | Float | Bool | String
         | Ident					
         | "(#)"					[klabel(VoidValue)]
	 | "(" ")"
       	 | "*" Exp					[strict,klabel(deref)]
	 |  Exp "." Exp					[left,klabel(#field),strict(1)]
	 > Exp  "(" Exps ")"				[left,klabel(#funCall),strict(1,2)]
	 | "&" Mut Exp					[strict(2), klabel(borrow)]
	 | "&" Exp					[klabel(borrowImm)]
	 | "#rallocate" "(" RSType ")"			[klabel(NewT)]
	 | "#rallocate" "(" RSType "," Exp ")"		[klabel(NewS),strict(2)]
	 | "#rallocate" "(" RSType ";" Exps ")"		[klabel(#NewD)]
	 | "heap::allocate" "(" Exp "," RSType  ")"   		[klabel(#HeapAlloc),strict(1)]
	 | "call" Exp "(" Exps ")"			[strict(2),klabel(FunCall)]
	 | "polycall" Ident "(" Exps ")"		[strict(2),klabel(pfuncall)]
	 | "if" Exp "then" Block  "else" Block		[strict(1),klabel(#Ifr)]
	 | "if" Exp Block  	  	 		[klabel(#onlyIf)]
	 | "if" Exp  Block ElseIfs "else" Block		[strict(1),klabel(#If)]
	 | "case" Exp "of" "{" Blocks "}" 	 	[klabel(Case)]
	 | ArithExp
	 | Assignstmt					
	 | "(" Exp ")"					[bracket]
	 | "*" "self"
	 | #arrayExp(Int)
	 | "self" "." Exp
	 | Ident "{" IdVals "}"				[klabel(#prodInit)]
	 | #lenStr(Exp) 	    			[strict]
	 | #rawpt(Exp)					[strict]
	 | "#Undef_Value"
	 /** operations for  multi-threaded **/
    	 | #spawn(Exp, Exp)				[strict]
	 | "unsafe" Block				[klabel(#unsafe)]
	 |  Exp "as" RSType				[strict(1),klabel(#cast)]
	 | "self" "as" RSType				[klabel(#castSelf)]


syntax ElseIf
       ::= "else" "if" Exp Block				[klabel(#elseif)]

syntax ElseIfs
       ::= List{ElseIf, ""}	 

syntax priorities
         #field
       > #funCall
       > #assign

	

syntax Blocks
       ::= List{Block, ","}

syntax Block
       ::= "{" Stmts "}"
         | "{" Stmts Exp "}"

syntax Stmts
       ::= List{Stmt, ""}				[klabel(#stmts)]

syntax Stmt
       ::= Letstmt					
         | Block
	 | "val" "(" Exp ")"				[strict, klabel(valueStmt)]
         | Exp ";"					[strict, klabel(expStmt)]
	 | "return" Exp ";"				[strict, klabel(#returnStmt)]
	 | "return" ";"					[klabel(#returnEmpty)]
	 | "assert!" "(" Exp ")" ";"			[strict, klabel(#assertion)]
	 | "assert_eq!" "(" Exp "," Exp ")" ";"		[klabel(#asserteq)]
	 | "panic!" "(" Exp ")" ";"   	 		[strict]
	 | "panic!" "(" ")" ";"   	 		
	 | "println!" "(" String "," Exps ")" ";"	[strict(2), klabel(#printlnparams)]
	 | "println!" "(" String ")" ";"      		[klabel(#println)]
	 | #memReferto(Exp,Exp)				[strict]
	 //------- loop statements ------------
	 | "loop" Block					[klabel(#loopr)]
	 | "break" ";"					[klabel(#breakr)]
	 | "while" Exp Block				[strict(1), klabel(#whiler)]
	 // for debugging
	 | #Stop(String, Exps)
	 | "#breakpoint"
	 | Block
	 | "_Rust_await" "(" Exp ")" ";"			[strict]



	 

syntax Assignstmt
       ::= Exp "=" Exp					[klabel(#assign)]
         | Exp "=" "inj" Int Exp 			[klabel(#assignSum)]


syntax ArithExp
       ::= left:
       	   Exp "*" Exp					[strict,left,klabel(arithMul)]
	 | Exp "/" Exp					[strict,left,klabel(arithDiv)]
	 | Exp "mod" Exp				[strict,left,klabel(arithMod)]
	 | Exp "%" Exp					[left,klabel(arithModO)]
	 | Exp "^" Exp					[strict,left,klabel(artihPow)]
	 >left:
	   Exp "+" Exp					[strict,left,klabel(arithPlus)]
	  |Exp "-" Exp					[strict,left,klabel(arithMinus)]
	 >left:
	   Exp "<=" Exp					[strict,left,klabel(arithLeq)]
	 | Exp "==" Exp					[strict,left,klabel(aritheql)]
	 | Exp "<" Exp					[strict,left,klabel(arithle)]
	 | Exp ">" Exp					[strict,left,klabel(arithge)]
	 | Exp ">=" Exp					[strict,left,klabel(arithgeq)]
	 >left:
	   Exp "&&" Exp					[strict,left,klabel(#logicand)]
	 | Exp "||" Exp					[strict,left,klabel(#logicor)]
	 | Exp "&"  Exp					[strict,left,klabel(#bitand)]

syntax Exp
       ::= elem(Exp)					[strict,klabel(element)]
         | #expcl(ExpCL)

syntax priorities
	    arithgeq
	  > #assign

syntax priorities
	    deref
	  > #field
	  > borrow
	  > arithMul


syntax priorities
	    arithgeq
	 >  #closureExp #closureBlock #mclosureExp #mclosureBlock
         

/*
   The let statement, the Ident is alive in the Block
*/

syntax Letstmt
       ::= "let" Mut Ident "=" Exp ";"			[klabel(letStmtInit)]
         | "let" Mut Ident ":" RSType "=" Exp ";"	[klabel(letStmtInitType)]
         | "let" Ident "=" Exp	   ";"	      		[klabel(letStmtInitDefault)]
         | "let" Ident ":" RSType "=" Exp ";"	      	[klabel(letStmtInitDefaultType)]
         | "let" Mut Ident 	   ";"			[klabel(letStmt)]
	 | "let" Mut Ident ":" RSType 	   ";"		[klabel(letStmtType)]
	 | "let" Ident 		   ";"			[klabel(letStmtDefault)]
	 | "let" Ident ":" RSType 		   ";"	[klabel(letStmtDefaultType)]

syntax Exps
       ::= List{Exp,","}		[strict, klabel(#rexplist)]



/*Type definition*/

syntax TyDecl
       ::= Ident ":=:" CoreTy

syntax TyDecls
       ::= List{TyDecl, ";"}


/*@*******************************************
	The Syntax for Closure
**********************************************/

syntax Exp
       ::= Closure

syntax Closure
       ::= "|" TypeIds "|" Exp			[klabel(#closureExp)]
         | "|" TypeIds "|" Block		[klabel(#closureBlock)]
	 | "move" "|" TypeIds "|" Exp		[klabel(#mclosureExp)]
	 | "move" "|" TypeIds "|" Block		[klabel(#mclosureBlock)]

/*******************************************
	The terms only for type checking
********************************************/

syntax TypeIds
       ::= List{TypeId, ","}				[klabel(#typeIds)]

syntax TypeId
       ::= Ident ":" RSType				[klabel(#typeId1)]
         | "mut" Ident ":" RSType			[klabel(#typeId2)]
	 | "self"					[klabel(#self)]
	 | "&" "mut" "self"				[klabel(#mutself)]
	 | "&" "self"					[klabel(#immself)]

syntax Id
       ::= "#selfX"

syntax Ident
       ::= "#noName"

syntax Exp
       ::= ExpTy


syntax ExpTy
       ::= #lhsTy(Exp,CoreTy)
         | #expTy(Exp,CoreTy)
	 

syntax ExpTys
       ::= List{ExpTy,","}		[klabel(#exptylist)]


syntax Exps
       ::= ExpTys

syntax NElifetime
       ::= "#newlft"
         | "#endlft"

/*
syntax VarId
       ::= cvar(Exp,Int)	[klabel(CSimpVar)]
	 | #Heap(Exp,CoreTy)
*/

/*@***************************************************
	The syntax for impl methods for types
******************************************************/

syntax TyMethodDecl
       ::= "impl" RSType "{" FunDeclCs "}"			[klabel(#tyMethodDecl1)]

/*@**************************************
	The syntax for traits
*****************************************/

syntax ImplTrait
       ::= "impl" Ident "for" CoreTy "{" FunDeclCs "}"		[klabel(#traitsDef)]
         | "impl" Ident "for" Ident "{" FunDeclCs "}"		[klabel(#traitsDefIdent)]

syntax FunDeclCs
       ::= List{FunDeclC, ""}					[klabel(#FunDecls)]

syntax Trait
       ::= "trait" Id "{" TraitElems "}"

syntax ExpTys
       ::= #gettraitObjs(ExpTys, CoreTys)			[function]

syntax ExpTy
       ::= #traitObj(ExpTy)

syntax Id
       ::= #tpath(Exp,CoreTy,Ident)

syntax TraitElems

syntax TraitElem
       ::= TyDecl ";"

syntax TraitElems
       ::= List{TraitElem, ""}					[klabel(#traitElems)]

syntax TraitElem
       ::= "gtype" Ident ";"					[klabel(#assocTy)]
       	 | "fn" Ident "(" RSTypes ")" "->" RSType  ";"		[klabel(#traitInterface)]
	 | "fn" Ident "(" RSTypes ")" ";"	   	   	[klabel(#traitInterfaceVoid)]
	 | "fn" Ident "(" TypeIds ")" "->" RSType  ";"		[klabel(#traitInterfaceTypeIds)]
	 | "fn" Ident "(" TypeIds ")"   ";"			[klabel(#traitInterfaceVoid)]

syntax Exp
       ::= #prodInitm(CoreTy,Exps)		[strict(2)]



syntax Enum
       ::= "enum" Ident "<" GParams  ">" "{" EnumElems  "}"		[klabel(#enumDef2)]
         | "enum" Ident "{" EnumElems "}"    				[klabel(#enumDef1)]

syntax EnumElems
       ::= List{EnumElem, ","}				[klabel(#enumElems)]

syntax EnumElem
       ::= Ident					
         | Ident "(" RSTypes ")"			[klabel(#enumElem1)]
	 | Ident "{" TypeIds "}" 



/*@************************************************

	The syntax for pattern matching

	pattern matching have several cases

	1: scalar types
	2: product types
	3: sum types

***************************************************/

syntax Exp
       ::= "match" Exp "{" Arms "}"		[klabel(#matchexp)]


syntax Arms
       ::= List{Arm, ","}


syntax Arm
       ::= Pattern "=>" Exp			[klabel(#armExp)]
         | Pattern "=>" Block			[klabel(#armBlock)]


syntax Pattern
       ::= Int | Bool | Ident
         | Ident "(" IdVals ")"				[klabel(#prodPattern0)]
         | Ident "{" IdVals "}"				[klabel(#prodPattern1)]
	 | "&" Ident "{" IdVals "}"			[klabel(#prodPatternimmref)]
	 | "&" "mut" Ident "{" IdVals "}"		[klabel(#prodPatternmutref)]
	 | "default"


syntax IdVal
       ::= Ident ":" Exp				[klabel(#IdVal)]
         | Ident
	 | "mut" Ident
	 | "mut" Ident ":" Exp				[klabel(#IdVal1)]
	 | "ref" Ident
	 | "ref" "mut" Ident


syntax IdVals
       ::= List{IdVal, ","}			[klabel(#IdVals)]

syntax GParam
       ::= Lifetime
         | Ident

syntax GParams
       ::= List{GParam,","}

syntax Struct
       ::= "struct" Ident "<" GParams  ">" "{" TypeIds "}"	[klabel(#structDef1)]
         | "struct" Ident "{" TypeIds "}"			[klabel(#structDef2)]
         | "struct" Ident "(" RSTypes ")"			[klabel(#structDef3)]

	

syntax ENUMITEM
       ::= #penum(Ident,Fields)					
         | #setSumField(Ident,Fields,Int)

syntax Id
       ::= #fenum(K,K)



syntax Exp
       ::= "vec!" "[" Exps "]"			[strict]
         | "[" Exps "]"				[strict]
	 | Exp "[" Exp "]"			[seqstrict, klabel(#indexAccess)]
	 | #RIndex(Exp,Exp)


syntax Exp
       ::= Ident "::" Ident "{" IdVals "}"		[klabel(#sumInit)]
         | Ident "::" Ident				[klabel(#fieldfun)]

syntax Int
       ::= #sizeofExps(Exps)			[function]


rule #sizeofExps(.Exps)	=> 0
rule #sizeofExps(.ExpTys) => 0
rule #sizeofExps(E:Exp, Es:Exps) => 1 +Int #sizeofExps(Es)
rule #sizeofExps(#exptylist(E:ExpTy, Es:ExpTys)) => 1 +Int #sizeofExps(Es)


/************************************************************
	Syntax for Memory Operations
*************************************************************/

syntax Exp
       ::= "_Rust_memcpy" "(" Exp "," Exp "," Exp ")"			[strict]
         | #intrinsicDeallocate(Exp)			[strict]
	 | #intrinsicWrite(Exp,Exp)			[strict]
	 | #intrinsicRead(Exp)				[strict]
	 | "_Rust_reallocate" "(" Exp "," Exp ")"		[strict]
	 | #forget(Exp)				[strict]
	 | #offsetr(Exp,Exp)			[strict]


/********************** Map ********************/
/*
 *	The operation mapValue has two parameters
 *      1. First is the address of the map
 * 	2. Second is the key
 */
/***********************************************/
syntax Exp
       ::= #mapKeyin(Exp, Exp)		[strict]
         | #mapValue(Exp, Exp)		[strict]
         | #mapAdd(Exp,Exp,Exp)		[strict]

syntax Stmts
       ::= #ExpStmts2Stmts(Stmts, Exp)		[function]

syntax Int
       ::= unwrapInt(K)		[function]




/***************** library *****************/

syntax Exp
       ::= lhs(Exp)


syntax ReplaceTerm
       ::= #rpt(K,K)
         | #getReplaceTerm(CoreTy, CoreTy)		[function]
	 | "#nonerpt"


syntax ReplaceTerms
       ::= List{ReplaceTerm, ","}			[klabel(#replaceTerms)]
         | #getReplaceTerms(ExpTys, CoreTys)		[function]


rule #getReplaceTerm(T:CoreTy, #ty(X)) => #rpt(X,T)
rule #getReplaceTerm(#ref(T:CoreTy), #ref(T1)) => #getReplaceTerm(T,T1)
rule #getReplaceTerm(#raw(T:CoreTy), #raw(T1)) => #getReplaceTerm(T,T1)

rule #getReplaceTerm(#owner(T:CoreTy), #owner(T1)) => #getReplaceTerm(T,T1)
rule #getReplaceTerm(T:CoreTy, i32) => #nonerpt
rule #getReplaceTerm(T:CoreTy, bool) => #nonerpt

//rule #getReplaceTerm(#IdTy(TN:Ident, Fi), #IdTy(TN:Ident, )) => #nonerpt



rule #getReplaceTerms(#exptylist(#expTy(_,T1:CoreTy), Es:ExpTys),
		         #CoreTys(T:CoreTy, Ts:CoreTys))
			  => #replaceTerms(#getReplaceTerm(T1,T), #getReplaceTerms(Es,Ts))

rule #getReplaceTerms(.ExpTys, _) => .ReplaceTerms

syntax CoreTy
       ::= #replaceTvar(K,Ident,CoreTy)		[function]

syntax Fields
       ::= #replaceTvarFields(Fields, Ident, CoreTy)	[function]

syntax Field
       ::= #replaceTvarField(Field, Ident, CoreTy)	[function]


rule #replaceTvar(#IdTy(V:Ident, T:CoreTy), V1:Ident, T1:CoreTy)
     			=> #IdTy(V, #replaceTvar(T,V1,T1))
			
rule #replaceTvar(#prod(Fs:Fields), V1:Ident, T1:CoreTy)
     		        => #prod(#replaceTvarFields(Fs,V1,T1))

rule #replaceTvar(#owner(T:CoreTy), V1:Ident, T1:CoreTy)
     			=> #owner(#replaceTvar(T,V1,T1))


rule #replaceTvarFields(#Fields(F:Field, Fs:Fields), V1:Ident, T1:CoreTy)
     		        => #Fields(#replaceTvarField(F, V1, T1), #replaceTvarFields(Fs,V1,T1))

rule #replaceTvarField( #fd(X:Ident, T:CoreTy), V1:Ident, T1:CoreTy )
     				    => #fd(X, #replaceTvar(T,V1,T1))

rule #replaceTvarFields(.Fields,_:Ident, _:CoreTy) => .Fields

rule #replaceTvar(#ty(X:Ident),V1:Ident,T1:CoreTy) => T1
     requires X ==K V1

rule #replaceTvar(#ty(X:Ident),V1:Ident,T1:CoreTy) => #ty(X)
     requires X =/=K V1

rule #replaceTvar(i32, V1:Ident,T1:CoreTy) => i32

rule #replaceTvar(#raw(T:CoreTy), V1:Ident, T1:CoreTy) => #raw(#replaceTvar(T,V1,T1))


syntax CoreTy
       ::= #replaceTvars(ReplaceTerms,CoreTy)		[function]


rule #replaceTvars(#replaceTerms(#rpt(X:Ident,T:CoreTy), RTs:ReplaceTerms), T1:CoreTy)
     	=> #replaceTvars(RTs, #replaceTvar(T1,X,T))

rule #replaceTvars(#replaceTerms(#nonerpt, RTs:ReplaceTerms), T1:CoreTy)
     	=> #replaceTvars(RTs, T1)


rule #replaceTvars(.ReplaceTerms, T:CoreTy) => T

syntax ENVITEM
       ::= #envitem(KItem)			[strict]


endmodule











































