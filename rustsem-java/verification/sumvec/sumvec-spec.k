

module SUMVEC-SPEC

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
	 fun sum ( var ( 0 ) , var ( 1 ) , .Idents ) { (|
               letcl var ( 2 ) =cl valcl ( 0 ) incl
                 letcl var ( 3 ) =cl valcl ( 0 ) incl        
                 ( #loop var ( 2 ) <-cl var ( 1 )
                   { (| var ( 3 ) :=cl var ( 3 ) +cl #Index ( var ( 0 ) , var ( 2 ) ) ;cl
                     clskip ;cl clskip ;cl var ( 2 ) :=cl var ( 2 ) +cl valcl ( 1 )
                     ;cl clskip ;cl clskip |) } ;cl var ( 3 ) ) |) } ;cl
         assertcl(callcl(sum, var(101), var(102)) ==cl valcl(RES:Int))
          => #unit
      </k>
      <env>
          var ( 101 ) |-> #sl(0)
	  var ( 102 ) |-> #sl(1)
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
	  0 |-> #own(#blk(0))
	  1 |-> valcl(size(L)) 
        </sloc>
	<blkAddr> 1 </blkAddr>
	<blocks> 
	   vecMap(0)(L:List) => BLKS:Map
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