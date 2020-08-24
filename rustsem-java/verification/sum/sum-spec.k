
module SUM-SPEC

imports CLANG


rule
    <T>
     <threads>
	<Thread>
	 <threadId> 0 </threadId>
	 <tname> "main" </tname>
	 <k>
         fun sum ( var ( 0 ) , .Idents )
	 {(| letcl var ( 1 ) =cl valcl ( 0 ) incl
	      letcl var ( 2 ) =cl var ( 0 ) incl (
	      	 #loop var ( 2 ) >-cl valcl ( 0 )
		 { (|
		     var ( 1 ) :=cl var ( 1 ) +cl var ( 2 )  ;cl  clskip ;cl clskip ;cl
		     var ( 2 ) :=cl var ( 2 ) -cl valcl ( 1 ) ;cl clskip ;cl clskip
		 |) }
			;cl
                 var ( 1 ) )
             |) }
        ;cl
	 assertcl( callcl(sum, valcl(SN:Int) , .ExpCLs)
	      ==cl valcl(SN) *-cl (valcl(SN) +cl valcl(1)) /-cl valcl(2))
    	 => #unit
      </k>
      <env> .Map => ENVL:Map
      </env>
      <clstack> .List => L:List </clstack>
      </Thread>
      <activeThreads> SetItem(0) </activeThreads>
      <cntThreads> 1:Int </cntThreads>
      <cthread> 0 </cthread>
   </threads>

   <closures>
	<closureCnt> 0:Int => NT:Int  </closureCnt>
	<funclosure> .Map => Rho:Map </funclosure>
	(.Bag => _ )
   </closures>
    <memory>
	<slocAddr> 0:Int => SLOCADDR:Int </slocAddr>
	<sloc> .Map => M1:Map </sloc>
	<blkAddr> 0:Int </blkAddr>
	<blocks> .Map </blocks>
	<locRW> .Set => LOCRW:Set </locRW>
	<memStatus> .Map => MEMST:Map</memStatus>
	<clk> 0:Int => CLKN:Int </clk>
    </memory>
    <output> .List </output>
  </T>
   requires SN >=Int 0


rule <T>
       <threads>
	<Thread>
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
	   var ( 1 ) |-> #sl( SL1:Int ) 
	   var ( 2 ) |-> #sl( SL2:Int ) 
	 ...
      </env>
      <clstack> CLSTACKS:List </clstack>
      </Thread>
      <activeThreads> SetItem(0) </activeThreads>
      <cntThreads> 1:Int </cntThreads>
      <cthread> 0 </cthread>
   </threads>

     <closures>
	<closureCnt> CLN:Int  </closureCnt>
	<funclosure> FUNCLOSURE:Map  </funclosure>
	CLOSURE:Bag
     </closures>
         <memory>
	<slocAddr> SLOCADDR:Int </slocAddr>
	<sloc> 
             ...
             SL1 |-> valcl(N1:Int => N1 +Int (N2 +Int 1) *Int N2 /Int 2)
             SL2 |-> valcl(N2:Int => 0)
             ...
        </sloc>
	<blkAddr> 0:Int </blkAddr>
	<blocks> .Map </blocks>
	<locRW> LOCRW:Set => LocRW1:Set </locRW>
	<memStatus>
	  ...
          #sl( SL1 ) |-> #ms(0, 0)
	  #sl( SL2 ) |-> #ms(0, 0)
	  ...
	</memStatus>
	<clk> CLK1:Int => CLKN:Int </clk>
    </memory>
    <output> .List </output>
     </T>
     requires (N2 >=Int 0) andBool (N1 >=Int 0)
     
endmodule


