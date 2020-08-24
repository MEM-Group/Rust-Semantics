
module SUM-SPEC1

imports CLANG

rule <T>
       <threads>
	<thread>
	 <threadId> 0 </threadId>
	 <tname> "main" </tname>
	 <k>
	    #loop var ( 2 ) >-cl valcl ( 0 ) 
            { (|
	         var ( 1 ) :=cl var ( 1 ) +cl var ( 2 ) ;cl clskip ;cl clskip ;cl
		 var ( 2 ) :=cl var ( 2 ) -cl valcl ( 1 ) ;cl clskip ;cl clskip
	      |) }
           => #unit ...
   	 </k>
      <env>
           ...
	   var ( 1 ) |-> #sl(SL1:Int) 
	   var ( 2 ) |-> #sl(SL2:Int) 
	   ...
      </env>
      <clstack> CLSTACK:List </clstack>
      </thread>
      <activeThreads> SetItem(0) </activeThreads>
      <cntThreads> 1:Int </cntThreads>
   </threads>

     <closures>
	<closureCnt> CLN:Int  </closureCnt>
	<funclosure> FUNCLOSURE:Map  </funclosure>
	CLO:Bag
     </closures>
         <memory>
	<slocAddr> SLOCADDR:Int </slocAddr>
	<sloc> 
            ...
             SL1 |-> valcl(N1:Int => N1 +Int ((N2 +Int 1) *Int N2 /Int 2))
             SL2 |-> valcl(N2:Int => 0)
             ...
        </sloc>
	<blkAddr> 0:Int </blkAddr>
	<blocks> .Map </blocks>
	<locRW> LOCRW:Set => LocRW1:Set </locRW>
	<memStatus> .Map </memStatus>
	<clk> CLK1:Int => CLKN:Int </clk>
    </memory>
    <output> .List </output>
     </T>
     requires (N1 >=Int 0) andBool (N2 >=Int 0)

endmodule


