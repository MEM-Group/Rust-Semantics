
module T4-SPEC

import CLANG
import VEC-PATTERN
import INT_LIST

rule
    <T>
     <threads>
        <Thread>
         <threadId> 0 </threadId>
         <tname> "main" </tname>
         <k> fun main ( .Idents ) { (|

letcl var ( 0 ) =cl #AllocateInit ( valcl ( 1 ) ,
            #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( N0:Int ) , .ExpCLs ) incl
letcl var ( 1 ) =cl #AllocateInit ( valcl ( 1 ) ,
            #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( N1:Int ) , .ExpCLs ) incl
letcl var ( 2 ) =cl #AllocateInit ( valcl ( 1 ) ,
            #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( N2:Int ) , .ExpCLs ) incl
letcl var ( 5 ) =cl #AllocateInit ( valcl ( 4 ) ,
            #owner ( #array ( #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 5 ) ) ,
	    #move ( var ( 0 ) ) ,
	    #move ( var ( 1 ) ) ,
	    #move ( var ( 2 ) ) ,
	     .ExpCLs ) incl

letcl var ( 6 ) =cl #move ( #Index ( var ( 5 ) , valcl ( 2 ) ) ) incl #print ( "{}" , #Index ( var ( 5 ) , valcl ( 2 ) ) .cl valcl ( 0 ) , .ExpCLs ) |) }  ;cl
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
    <output> .List => OUTPUT:List </output>
  </T> 

endmodule