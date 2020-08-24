

module FIRST-SPEC

import CLANG
import VEC-PATTERN



rule
    <T>
     <threads>
	<thread>
	 <threadId> 0 </threadId>
	 <tname> "main" </tname>
	 <k>
	 fun first ( var ( 0 ) , .Idents ) {
	 (| #Index ( var ( 0 ) , valcl ( 0 ) )  |) }
	 ;cl
	 assertcl(callcl(first, var ( 1 )) ==cl valcl(FI))
    	  => #unit
      </k>
      <env>
          var ( 1 ) |-> #sl(0:Int)
      </env>
      <clstack> .List => CLSTACK:List </clstack>
      </thread>
      <activeThreads> SetItem(0) </activeThreads>
      <cntThreads> 1:Int </cntThreads>
   </threads>

   <closures>
	<closureCnt> 0:Int => NT:Int  </closureCnt>
	<funclosure> .Map => Rho:Map </funclosure>
	(.Bag => _:Bag)
   </closures>
    <memory>
	<slocAddr> 1:Int => SLOCADDR:Int </slocAddr>
	<sloc>
	   0 |-> #own(#blk(0))
        </sloc>
	<blkAddr> 1 </blkAddr>
	<blocks> 
	   vecMap(0)(ListItem(FI:Int) VECL:List) => MB:Map
	</blocks>
	<locRW> .Set => LOCRW:Set </locRW>
	<memStatus> .Map => MEMS:Map </memStatus>
	<clk> 0:Int => CLKN:Int </clk>
    </memory>
    <output> .List </output>
  </T>


rule
    <T>
     <threads>
	<thread>
	 <threadId> 0 </threadId>
	 <tname> "main" </tname>
	 <k>
	 #freeBlk(A:Int,I:Int)
    	  => #unit ...
      </k>
      <env>
	   ENV:Map
      </env>
      <clstack> CLSTACK:List </clstack>
      </thread>
      <activeThreads> SetItem(0) </activeThreads>
      <cntThreads> 1:Int </cntThreads>
   </threads>

   <closures>
	<closureCnt>  NT:Int  </closureCnt>
	<funclosure>  Rho:Map </funclosure>
	CLOSURES:Bag
   </closures>
    <memory>
	<slocAddr>  SLOCADDR:Int </slocAddr>
	<sloc>
	   SLOC:Map
        </sloc>
	<blkAddr> BLKADDR:Int </blkAddr>
	<blocks>
	  BLKS:Map => BLSK:Map
	</blocks>
	<locRW> LOCRW:Set </locRW>
	<memStatus> MEMS:Map </memStatus>
	<clk> CLKN:Int </clk>
    </memory>
    <output> .List </output>
  </T>
  requires (A >=Int 0) andBool (I >=Int 0) 



endmodule