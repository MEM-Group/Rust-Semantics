

module SUMVEC-SPEC1

import CLANG
import VEC-PATTERN
import INT_LIST

/*
rule
    <T>
     <threads>
	<thread>
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
	<slocAddr> 2:Int => SLOCADDR:Int </slocAddr>
	<sloc>
	  0 |-> #own(#blk(0))
	   1 |-> valcl(SIZE:Int) 
        </sloc>
	<blkAddr> 1 </blkAddr>
	<blocks> 
	vecMap(0)(L:List) => BLOCKS:Map
	</blocks>
	<locRW> .Set => LOCRW:Set </locRW>
	<memStatus> .Map => MEMS:Map </memStatus>
	<clk> 0:Int => CLKN:Int </clk>
    </memory>
    <output> .List </output>
  </T>
  requires RES ==Int #sumList(L)
*/


rule
    <T>
     <threads>
	<thread>
	 <threadId> 0 </threadId>
	 <tname> "main" </tname>
	 <k>
         
	 #loop var ( 2 ) <-cl var ( 1 )
         { (|
            var ( 3 ) :=cl var ( 3 ) +cl valcl(1) ;cl clskip ;cl clskip ;cl
             var ( 2 ) :=cl var ( 2 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip 
         |) }
          => #unit ...
      </k>
      <env>
          ...
          var ( 0 ) |-> #sl(N0:Int)
	  var ( 1 ) |-> #sl(N1:Int)
          var ( 2 ) |-> #sl(N2:Int)
	  var ( 3 ) |-> #sl(N3:Int)
          ...
      </env>
      <clstack> CLSTACK:List => CLSTACKP:List </clstack>
      </thread>
      <activeThreads> SetItem(0) </activeThreads>
      <cntThreads> 1:Int </cntThreads>
   </threads>

   <closures>
	<closureCnt> NT:Int  </closureCnt>
	<funclosure> sum |-> 0 </funclosure>
	CLOSURES:Bag
   </closures>
    <memory>
	<slocAddr> SLOCADDR:Int </slocAddr>
	<sloc>
	  ...
	  N0 |-> #own(#blk(0))
	  N1 |-> valcl(V1:Int) 
	  N2 |-> valcl(V2:Int => V1)
	  N3 |-> valcl(V3:Int => V4:Int)
          ...
        </sloc>
	<blkAddr> 1 </blkAddr>
	<blocks> 
              ...
	      ( 
                vecMapB(0,0)(L1:List) 
	        vecMapB(0,V2)(ListItem(I) L2:List)
	      ) =>
	      (
	        vecMapB(0,0)(L1 ListItem(I) L2)
		vecMapB(0,V1)(.List)
	      )
	      ...
	</blocks>
	<locRW> LOCRW:Set => LOCRW1:Set </locRW>
	<memStatus> MEMS:Map => MEMS1:Map </memStatus>
	<clk> CLK:Int => CLKN:Int </clk>
    </memory>
    <output> .List </output>
  </T>
  requires V1 ==Int size(L1 ListItem(I) L2) andBool V2 >=Int 0 andBool
  	   V2 ==Int size(L1) andBool V2 <Int V1



rule
    <T>
     <threads>
	<thread>
	 <threadId> 0 </threadId>
	 <tname> "main" </tname>
	 <k>
         
	 #loop var ( 2 ) <-cl var ( 1 )
         { (|
            var ( 3 ) :=cl var ( 3 ) +cl valcl(1) ;cl clskip ;cl clskip ;cl
             var ( 2 ) :=cl var ( 2 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip 
         |) }
          => #unit ...
      </k>
      <env>
          ...
          var ( 0 ) |-> #sl(N0:Int)
	  var ( 1 ) |-> #sl(N1:Int)
          var ( 2 ) |-> #sl(N2:Int)
	  var ( 3 ) |-> #sl(N3:Int)
          ...
      </env>
      <clstack> CLSTACK:List => CLSTACKP:List </clstack>
      </thread>
      <activeThreads> SetItem(0) </activeThreads>
      <cntThreads> 1:Int </cntThreads>
   </threads>

   <closures>
	<closureCnt> NT:Int  </closureCnt>
	<funclosure> sum |-> 0 </funclosure>
	CLOSURES:Bag
   </closures>
    <memory>
	<slocAddr> SLOCADDR:Int </slocAddr>
	<sloc>
	  ...
	  N0 |-> #own(#blk(0))
	  N1 |-> valcl(V1:Int) 
	  N2 |-> valcl(V1:Int)
	  N3 |-> valcl(V3:Int)
          ...
        </sloc>
	<blkAddr> 1 </blkAddr>
	<blocks> 
           ...
	   vecMapB(0,0)(L1:List )
	   vecMapB(0,V1)(.List)
	   ...
	</blocks>
	<locRW> LOCRW:Set => LOCRW1:Set </locRW>
	<memStatus> MEMS:Map => MEMS1:Map </memStatus>
	<clk> CLK:Int => CLKN:Int </clk>
    </memory>
    <output> .List </output>
  </T>
  requires V1 ==Int size(L1)




endmodule