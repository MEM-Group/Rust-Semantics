
module T7-SPEC

import CLANG
import VEC-PATTERN
import INT_LIST

rule
    <T>
     <threads>
        <Thread>
         <threadId> 0 </threadId>
         <tname> "main" </tname>
         <k> fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( N1:Int ) , valcl ( N2:Int ) , .ExpCLs ) incl letcl var ( 1 ) =cl valcl ( 5 ) incl ( (| casecl { var ( 1 ) ==cl valcl ( 1 ) -> (| letcl var ( 2 ) =cl valcl ( 1 ) incl #print ( "1" , .ValueCLs ) |) ; var ( 1 ) ==cl valcl ( 5 ) -> (| letcl var ( 3 ) =cl valcl ( 5 ) incl letcl var ( 4 ) =cl #move ( var ( 0 ) ) incl clskip |) ; valcl ( 0 ) -> (| #print ( "n" , .ValueCLs ) |) ; .GuardedActions } |) ;cl clskip ;cl clskip ;cl letcl var ( 5 ) =cl #move ( var ( 0 ) ) incl clskip ) |) }  ;cl
         callcl(main, .ExpCLs)
          => #unit     </k>
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
	<blkAddr> 1 => BLKADDR:Int </blkAddr>
      <blocks>
           .Map => BLKS:Map
        </blocks>
        <locRW> .Set => LOCRW:Set </locRW>
        <memStatus> .Map => MEMS:Map </memStatus>
	<clk> 0:Int => CLKN:Int </clk>
    </memory>
    <output> .List </output>
  </T> 
endmodule