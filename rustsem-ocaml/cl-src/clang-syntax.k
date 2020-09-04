
/*!

\title{The Syntax of Core Languages for Rust}

*/

/*@
\section{Part 2. The Syntax of Items}
*/

require "memory-syntax.k"
require "importcl.k"
//require "clveri.k"


module CLANG-SYNTAX

imports MEMORY-SYNTAX
imports IMPORTCL
imports DOMAINS
imports DOMAINS-SYNTAX
//imports CLVERI

syntax Rust
       ::= ExpCL			//This is for testing

syntax ExpCL
       ::= "ifcl" ExpCL "thencl" ExpCL "elsecl" ExpCL		[klabel(ifexpcl)]
	 | "letcl" Ident "=cl" ExpCL "incl" ExpCL		[klabel(#letcl), strict(2)]
	 | ExpCL ";cl" ExpCL					[right,klabel(seqexpcl)]

syntax Id
       ::= "main"

/*@
  The syntax of expressions\\
  1. Ident: identifiers for variables
  2. Exp BinOp Exp: Binary operations over two operands
  3. * Order Exp: Dereference
  4. Exp := Order Exp : Assignment
  5. case Exp of ExpList: branch control
  6. fork{Exp}: invoke a thread
  7. Exp(ExpList): function call
*/


syntax ExpCL
       ::= Ident
         | ErrorState
         | ValueCL
	 | #cvarcl(ExpCL)			[strict]
	 | MemOp
	 | "*cl" Order ExpCL			[klabel(dereferencecl)]
	 | ExpCL ".cl" ExpCL			[klabel(fieldcl)]
	 | refcl(Int,ExpCL)			[klabel(referencecl)]
	 | #refallocate(ExpCL)			[strict]
	 | callcl(ExpCL, ExpCLs)		[klabel(funapplycl)]
	 | pcallcl(ExpCL, ExpCL ,ExpCLs)	[klabel(pfunapplycl)]
	 | ArithExpCL	   		
	 | ExpCL ":=cl" Order ExpCL  	       	[klabel(memwritecl),prefer]
	 | ExpCL ":=cl" ExpCL			[klabel(assignExpcl)]
	 | FnCL
	 | "(|" ExpCL "|)"			[klabel(blockcl)]
	 | ( ExpCL )				[bracket]
	 | "assertcl" "(" ExpCL ")"		[klabel(#assertcl), strict]
	 | "clskip"
	 | #move(ExpCL)
	 | #moveVal(ExpCL,ExpCL)		[strict(1)]
	 | StrExp
	 | #paniccl(ExpCL)			[strict]
	 | #rawcl(ExpCL)
	 | #print(String, ExpCLs)		[strict(2)]
	 | #retcl(ExpCL)			
	 | #endThread(Int)
	 | "#loop" ExpCL "{" ExpCL "}"		[klabel(#loopcl)]
	 | #loopstart(ExpCL)
	 | "#break"
	 | #drop(ExpCL)
	 | #wait(ExpCL)				[strict]
	 | #deallocate(ExpCL)
	 | "#destructThread"
	 //The following is undefined
         | #memcopy(ExpCL,ExpCL,ExpCL)		[strict(3)]
         | #offset(ExpCL, ExpCL)		[seqstrict]
         | #reallocate(ExpCL, ExpCL)		[seqstrict]
         | #AllocateInit(ExpCL,CoreTy,ExpCLs)   [seqstrict(1,3)]
         | #AllocateInitRaw(ExpCL,CoreTy,ExpCLs)   [seqstrict(1,3)]
         | #Allocate(ExpCL,CoreTy)		[strict(1)]
         | #RawCL(ExpCL)			[strict]
	 | #FieldA(ExpCL, ExpCL)		[strict(2)]
	 | #Index(ExpCL,ExpCL)
	 | "#stop"



syntax StrExp
       ::= #lenStrcl(ExpCL)			[strict]


syntax ExpCL
       ::= #forkcl(ExpCL, ExpCL)		[seqstrict]
	 | "casecl" ExpCL "of" "{" ExpCLs "}"	[strict(1),klabel(#casecl1)]
	 | "casecl" "{" GuardedActions  "}"	[klabel(#casecl2)]

syntax GuardedActions
       ::= List{GuardedAction, ";"}		[klabel(#guardedActions)]


syntax GuardedAction
       ::= ExpCL "->" ExpCL			[klabel(#guardedAction)]




syntax Ident
       ::= Id
         | "#anonymous"

syntax Ident
       ::= FunId

syntax FunId
       ::= funId(Int)
         | #funIdcl(Int)

syntax Id
       ::= #env(Int)
         | #envId(Int)




/*@
 additional priorities
*/


syntax priorities
         dereferencecl
       > fieldcl
       > funapplycl
       > arithmulcl arithdivcl arithpowcl 
       > arithpluscl arithminuscl
       > arithmodcl arithequcl lesseqcl lesscl greatcl greateqcl
       > memwritecl
       > assignExpcl
       > #letcl ifexpcl
       > seqexpcl
     


/*@
  The syntax of expressions for memory operations
*/

/*
syntax MemoryOperations
       ::= Allocate
         | Read
	 | Write
	 | Append
	 | Free
	 | CAS
	 | Memcopy
	 | CalAddress
*/

syntax ArithExpCL
       ::= left:
	   ExpCL "*-cl" ExpCL				[left, strict(1,2),klabel(arithmulcl)]
	 | ExpCL "/-cl" ExpCL				[left, strict(1,2),klabel(arithdivcl)]
	 | ExpCL "^-cl" ExpCL				[left, strict(1,2),klabel(arithpowcl)]
	 > left:
	   ExpCL "+cl" ExpCL				[left, strict(1,2),klabel(arithpluscl)]
	 | ExpCL "-cl" ExpCL				[left, strict(1,2),klabel(arithminuscl)]
	 > left:
	   ExpCL "==cl" ExpCL				[left, strict(1,2),klabel(arithequcl)]
	 | ExpCL "<=cl" ExpCL				[left, strict(1,2),klabel(lesseqcl)]
	 | ExpCL "<-cl" ExpCL				[left, strict(1,2),klabel(lesscl)]
	 | ExpCL ">-cl" ExpCL				[left, strict(1,2),klabel(greatcl)]
	 | ExpCL ">=cl" ExpCL				[left, strict(1,2),klabel(greateqcl)]
	 | ExpCL "modcl" ExpCL				[left, strict(1,2),klabel(arithmodcl)]
	 > left:
	   ExpCL "&&cl" ExpCL				[left, strict(1,2),klabel(#andcl)]
	 | ExpCL "||cl" ExpCL				[left, strict(1,2),klabel(#orcl)]
	 | ExpCL "&cl" ExpCL				[left, strict(1,2),label(#bitandcl)]

syntax ExpCL
       ::= boolval(Bool)		//[function]		


/*@
  Order indicate whether a read or write operation is atomic or non-atomic
*/
syntax Order
       ::= "sc"
         | "na"


/*@
 Function Definitions
*/


syntax FnCL
       ::= "fun" Ident "(" Idents ")" "{" ExpCL "}"
         | "fun" Ident "[" Ident "]" "(" Idents ")" "{" ExpCL "}"
         | "fun" "(" Idents ")" "{" ExpCL "}"



//syntax FnParamsCL
//       ::= Idents				

syntax Idents
       ::= List{Ident, ","}			[klabel(identscl)]


syntax ExpCLs
       ::= List{ExpCL, ","}			[strict,klabel(#ExpCLs)]


syntax ExpCLs
       ::= ValueCLs


/*@*********************************
	The following syntax
	is defined for traits.
	The first parameter is for the type.
	The second parameter is the name of the trait
	The third parameter is the name of a function
************************************/

syntax Id
       ::= #cpath(TP,Ident)			
         | #tpathcl(ExpCL,Ident)
	 | #tmppath(ExpCL)			[strict(1)]
	 | #tyExpCL(ExpCL,CoreTy)		[strict(1)]

syntax TP
       ::= CoreTy
         
	 
syntax ValueCL
       ::= #tyval(ValueCL,CoreTy)

syntax ValueCL
       ::= lhsV(Ident)

/*This is for assignment*/

syntax CLItem
       ::= lHS(ExpCL,ExpCL)	[strict]

syntax ExpCL
       ::= stackwrite(ExpCL,ExpCL)		[seqstrict(2,1)]
	 | heapwrite(ExpCL,Order,ExpCL)		[seqstrict(3,1)]
syntax ExpCL
       ::= lhscl(ExpCL)

syntax Ident
       ::= VarId

syntax VarId
       ::= var( Int )				
         | cvar( Exp, Int)			
	 | #Heap(Exp,CoreTy)

syntax Exp



/*****************verification********************/



syntax ExpCL
       ::= #countMem(Int)
         | #countBlock(Map)
	 | #referto(ExpCL,ExpCL)	[strict]

syntax Bool
       ::= #inSet(K,Set)    [function, smtlib(smt_set_mem)]

syntax Set
       ::= #list2Set(List)		[function]


syntax Int
       ::= #cThread(Int,Int)		[function]


rule #cThread(I:Int, I:Int) => I
rule #cThread(-1, I:Int) => I



/*********************** Testing *********************/





endmodule
