
module T16-SPEC

import CLANG
import VEC-PATTERN
import INT_LIST

rule
    <T>
     <threads>
        <Thread>
         <threadId> 0 </threadId>
         <tname> "main" </tname>
         <k> fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 5 ) , #vec ( i32 ) , valcl ( N1:Int ) , valcl ( N2:Int ) , valcl ( N3:Int ) , valcl ( N4:Int ) , valcl ( N5:Int ) , .ExpCLs ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( f , #owner ( #vec ( i32 ) ) ) , .Fields ) ) , #move ( var ( 0 ) ) , .ExpCLs ) incl letcl var ( 2 ) =cl #Index ( var ( 1 ) .cl valcl ( 0 ) , valcl ( 5 ) ) incl clskip |) }  ;cl
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