
module T39-SPEC

import CLANG
import VEC-PATTERN
import INT_LIST

rule
    <T>
     <threads>
        <Thread>
         <threadId> 0 </threadId>
         <tname> "main" </tname>
         <k> fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #IdTy ( B , #prod ( #fd ( a , i32 ) , #fd ( b , i32 ) , .Fields ) ) , valcl ( N1:Int ) , valcl ( N2:Int ) , .ExpCLs ) incl letcl var ( 1 ) =cl valcl ( 0 ) incl letcl var ( 2 ) =cl #uninit ( 0 ) incl letcl var ( 3 ) =cl #uninit ( 0 ) incl ( #loop var ( 1 ) <-cl valcl ( 2 ) { (| ifcl var ( 1 ) ==cl valcl ( 0 ) thencl (| clskip |) elsecl (| var ( 2 ) :=cl refcl ( 1 , var ( 0 ) .cl valcl ( 0 ) ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl ifcl var ( 1 ) ==cl valcl ( 1 ) thencl (| clskip |) elsecl (| var ( 3 ) :=cl refcl ( 1 , var ( 0 ) .cl valcl ( 1 ) ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl var ( 1 ) :=cl var ( 1 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl letcl var ( 4 ) =cl var ( 2 ) incl clskip ) |) }  ;cl
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
