

module FREEBLK

import CLANG
import VEC-PATTERN



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
	(CLOSURES:Bag)
   </closures>
    <memory>
	<slocAddr>  SLOCADDR:Int </slocAddr>
	<sloc>
	   SLOC:Map
        </sloc>
	<blkAddr> BLKADDR:Int </blkAddr>
	<blocks>
		...
		vecMapB(A,I)(L) => .Map
		...
	</blocks>
	<locRW> LOCRW:Set </locRW>
	<memStatus> MEMS:Map </memStatus>
	<clk> CLKN:Int </clk>
    </memory>
    <output> .List </output>
  </T>
  requires (A >=Int 0) andBool (I >=Int 0)


endmodule