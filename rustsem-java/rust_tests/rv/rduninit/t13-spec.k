
module T13-SPEC


import CLANG
import VEC-PATTERN
import INT_LIST

rule
    <T>
     <threads>
        <Thread>
         <threadId> 0 </threadId>
         <tname> "main" </tname>
         <k> fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( N1:Int ) , valcl ( N2:Int ) , .ExpCLs ) incl letcl var ( 4 ) =cl #AllocateInitRaw ( valcl ( 2 ) , #owner ( #closureTy ( #envId ( 0 ) , fnTy ( .CoreTys ) -> i32 ) ) , #AllocateInit ( valcl ( 1 ) , #IdTy ( #env ( 0 ) , #prod ( #fd ( b , #owner ( #array ( i32 , 2 ) ) ) , .Fields ) ) , #move ( var ( 0 ) ) , .ExpCLs ) , fun funId ( 0 ) ( var ( 1 ) , .Idents ) { letcl var ( 2 ) =cl #move ( var ( 1 ) .cl valcl ( 0 ) ) incl letcl var ( 3 ) =cl #move ( var ( 2 ) ) incl valcl ( 1 ) } , .ValueCLs ) incl ( #print ( "{}" , callcl ( var ( 4 ) .cl valcl ( 1 ) , var ( 4 ) .cl valcl ( 0 ) , .ExpCLs ) , .ExpCLs ) ;cl #print ( "{}" , #Index ( var ( 0 ) , valcl ( 0 ) ) , .ExpCLs ) ) |) }  ;cl
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