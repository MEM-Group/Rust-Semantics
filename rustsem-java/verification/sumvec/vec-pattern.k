


module VEC-PATTERN

import DOMAINS
imports CLANG


syntax Map ::= "vecMap" "(" Int ")" "(" List  ")"				[pattern(1)]


syntax Map ::= "vecMapB" "(" Int "," Int  ")" "(" List  ")"			[pattern(1)]


rule vecMap(B:Int)(L:List)
                   => B |-> #blkInfo(size(L),#vec(i32))
		      vecMapB(B,0)(L)
		   [pattern]

rule vecMapB(B:Int,O:Int)(ListItem(I:Int) RestL:List) =>
     	#heap(B,O) |-> valcl(I)
	vecMapB(B,O +Int 1)(RestL)
	[pattern]

rule vecMapB(B:Int,O:Int)(.List) => .Map    [pattern]


endmodule


