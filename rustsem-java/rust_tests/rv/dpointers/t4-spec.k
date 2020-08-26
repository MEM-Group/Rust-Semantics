

module T4-SPEC

import CLANG
import VEC-PATTERN
import INT_LIST

rule
    <T>
     <threads>
	<Thread>
	 <threadId> 0 </threadId>
	 <tname> "main" </tname>
	 <k>
fun main ( .Idents ) { (| letcl var ( 0 ) =cl #uninit ( 0 ) incl ( (| letcl var ( 1 ) =cl valcl ( N1:Int ) incl ( var ( 0 ) :=cl refcl ( 0 , var ( 1 ) ) ;cl clskip ;cl clskip ) |) ;cl letcl var ( 2 ) =cl *cl na var ( 0 ) incl clskip ) |) }
       ;cl 
         callcl(main, .ExpCLs)
          => #unit
      </k>
      <env>
          .Map => ENV:Map
      </env>
      <clstack> .List => CLSTACK:List </clstack>
      </Thread>
      <activeThreads> SetItem(0) </activeThreads>
      <cntThreads> 1:Int </cntThreads>
      <cthread> 0 </cthread>
   </threads>

   <closures>
	<closureCnt> 0:Int => NT:Int  </closureCnt>
	<funclosure> .Map => Rho:Map </funclosure>
	(.Bag => _:Bag)
   </closures>
    <memory>
	<slocAddr> 2:Int => SLOCADDR:Int </slocAddr>
	<sloc>
		.Map => SLOC:Map
        </sloc>
	<blkAddr> 1 </blkAddr>
	<blocks> 
	   .Map => BLKS:Map
	</blocks>
	<locRW> .Set => LOCRW:Set </locRW>
	<memStatus> .Map => MEMS:Map </memStatus>
	<clk> 0:Int => CLKN:Int </clk>
    </memory>
    <output> .List </output>
  </T>
  requires RES ==Int #sumList(L) andBool
  	   L ==K (ListItem(N1:Int) ListItem(N2:Int) ListItem(N3:Int) ListItem(N4:Int) ListItem(N5:Int) ListItem(N6:Int) ListItem(N7:Int) .List)


endmodule