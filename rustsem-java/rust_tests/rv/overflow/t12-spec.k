
module T12-SPEC

import CLANG
import VEC-PATTERN
import INT_LIST

rule
    <T>
     <threads>
        <Thread>
         <threadId> 0 </threadId>
         <tname> "main" </tname>
         <k> fun main ( .Idents ) { (| letcl var ( 2 ) =cl #AllocateInit ( valcl ( 3 ) , #owner ( #array ( i32 , 3 ) ) , valcl ( N1:Int ) , valcl ( N2:Int ) , valcl ( N3:Int ) , .ExpCLs ) incl ( callcl ( f , refcl ( 0 , var ( 2 ) ) , valcl ( 0 ) , .ExpCLs ) ;cl clskip ;cl callcl ( f , refcl ( 0 , var ( 2 ) ) , valcl ( 1 ) , .ExpCLs ) ;cl clskip ;cl callcl ( f , refcl ( 0 , var ( 2 ) ) , valcl ( 2 ) , .ExpCLs ) ;cl clskip ;cl callcl ( f , refcl ( 0 , var ( 2 ) ) , valcl ( 3 ) , .ExpCLs ) ;cl clskip ;cl callcl ( f , refcl ( 0 , var ( 2 ) ) , valcl ( 4 ) , .ExpCLs ) ;cl clskip ) |) } ;cl fun f ( var ( 0 ) , var ( 1 ) , .Idents ) { (| #Index ( *cl na var ( 0 ) , var ( 1 ) ) |) }  ;cl
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