
module T14-SPEC

import CLANG
import VEC-PATTERN
import INT_LIST

rule
    <T>
     <threads>
        <Thread>
         <threadId> 0 </threadId>
         <tname> "main" </tname>
         <k> fun main ( .Idents ) { (| letcl var ( 1 ) =cl callcl ( #cpath ( #owner ( #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) ) ) , new ) , valcl ( N1:Int ) , .ExpCLs ) incl letcl var ( 2 ) =cl #move ( var ( 1 ) ) incl letcl var ( 3 ) =cl #move ( var ( 1 ) ) incl clskip |) } ;cl fun #cpath ( #owner ( #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) ) ) , new ) ( var ( 0 ) , .Idents ) { (| #AllocateInit ( valcl ( 1 ) , #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) ) , #move ( var ( 0 ) ) , .ExpCLs ) |) }  ;cl
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