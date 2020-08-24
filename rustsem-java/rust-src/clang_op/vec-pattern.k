


module VEC-PATTERN

import DOMAINS
imports MEMORY-SYNTAX
imports CONFIGURATION
imports CLANG-SYNTAX

syntax ExpCLs
       ::= #List2ExpCLs(List)	[function]

rule #List2ExpCLs(.List) => .ExpCLs
rule #List2ExpCLs(ListItem(I:Int) RestL:List) => #ExpCLs(valcl(I), #List2ExpCLs(RestL))


syntax CTList
       ::= #ctlist(Int,CTList)	
       	 | ".CTList"

syntax Int
       ::= #ctlen(CTList)		[function, smtlib(smt_ctlist_len), lemma] 
         | #sumct(CTList)		[function, smtlib(smt_ctlist_sumct), lemma]

rule #sumct(.CTList) => 0
rule #sumct(#ctlist(I:Int,C:CTList)) => I +Int #sumct(C)

rule #ctlen(.CTList) => 0
rule #ctlen(#ctlist(I:Int,C:CTList)) => 1 +Int #ctlen(C)

syntax Map ::= #ctMap(Int,CTList)	     	[pattern(1),function]
       	     | #ctMapB(Int,Int,CTList)    [pattern(1),function]


rule #ctMap(B:Int,C:CTList) => B |-> #blkInfo(#ctlen(C),#vec(i32))
		               #ctMapB(B,0,C)
		   [pattern]

rule #ctMapB(B:Int,O:Int,#ctlist(I:Int,C:CTList)) => #heap(B,O) |-> valcl(I) #ctMapB(B,O +Int 1, C)
		   [pattern]

rule #ctMapB(_,_,.CTList) => .Map




syntax Map ::= "vecMap" "(" Int ")" "(" List  ")"				[function]


syntax Map ::= "vecMapB" "(" Int "," Int  ")" "(" List  ")"			[function]


rule vecMap(B:Int)(L:List)
                   => B |-> #blkInfo(size(L),#vec(i32))
		      vecMapB(B,0)(L)
		   [pattern]

rule vecMapB(B:Int,O:Int)(ListItem(I:Int) RestL:List) =>
     	#heap(B,O) |-> valcl(I)
	vecMapB(B,O +Int 1)(RestL)
//	[pattern]

rule vecMapB(B:Int,O:Int)(.List) => .Map
//     [pattern]



/*
rule #heap(B,O) |-> valcl(I:Int)
     vecMapB(B,O +Int 1)(RestL:List)
     F:Map
     => vecMapB(B,O)(ListItem(I) RestL)
     F
     [pattern-folding]


rule vecMapB(0,0)(L1:List )
     vecMapB(0,V2)(ListItem(I:Int) L2:List)
     F:Map
     => 
     vecMapB(0,0)(L1 ListItem(I) L2)
     vecMapB(0,size(L1) +Int size(L2) +Int 1)(.List)
     F
     requires V2 ==Int size(L1)
    [pattern-folding]

*/




endmodule


