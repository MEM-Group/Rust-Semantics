
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
         <k> ( ( ( fun main ( .Idents ) { (| letcl var ( 5 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( N1:Int ) , valcl ( N2:Int ) , .ExpCLs ) incl letcl var ( 6 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( ARC , #prod ( #fd ( p , #raw ( #owner ( #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) ) ) ) , .Fields ) ) , #RawCL ( refcl ( 1 , var ( 5 ) ) ) , .ExpCLs ) incl letcl var ( 9 ) =cl #AllocateInitRaw ( valcl ( 2 ) , #owner ( #closureTy ( #envId ( 0 ) , fnTy ( .CoreTys ) -> #void ) ) , #AllocateInit ( valcl ( 1 ) , #IdTy ( #env ( 0 ) , #prod ( #fd ( r , #owner ( #IdTy ( ARC , #prod ( #fd ( p , #raw ( #owner ( #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) ) ) ) , .Fields ) ) ) ) , .Fields ) ) , #move ( var ( 6 ) ) , .ExpCLs ) , fun funId ( 0 ) ( var ( 7 ) , .Idents ) { letcl var ( 8 ) =cl #move ( var ( 7 ) .cl valcl ( 0 ) ) incl ( *cl na ( var ( 8 ) .cl valcl ( 0 ) ) :=cl sc valcl ( N4:Int ) ;cl clskip ;cl clskip ) } , .ValueCLs ) incl letcl var ( 10 ) =cl callcl ( #cpath ( #owner ( #IdTy ( thread , #prod ( .Fields ) ) ) , spawn ) , #move ( var ( 9 ) ) , .ExpCLs ) incl letcl var ( 11 ) =cl #move ( var ( 5 ) ) incl ( callcl ( #cpath ( #owner ( #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) ) , join ) , refcl ( 0 , var ( 10 ) ) , .ExpCLs ) ;cl clskip ) |) } ;cl fun #cpath ( #owner ( #IdTy ( thread , #prod ( .Fields ) ) ) , spawn ) ( var ( 3 ) , .Idents ) { (| letcl var ( 4 ) =cl callcl ( #cpath ( #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , new ) , .ExpCLs ) incl callcl ( #cpath ( #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , spawn ) , #move ( var ( 4 ) ) , #move ( var ( 3 ) ) , .ExpCLs ) |) } ) ;cl fun #cpath ( #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , spawn ) ( var ( 1 ) , var ( 2 ) , .Idents ) { (| #AllocateInit ( valcl ( 1 ) , #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) , #forkcl ( *cl na ( var ( 1 ) .cl valcl ( 0 ) ) .cl valcl ( 0 ) , refcl ( 1 , var ( 2 ) ) ) , .ExpCLs ) |) } ) ;cl fun #cpath ( #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , new ) ( .Idents ) { (| #AllocateInit ( valcl ( 1 ) , #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) , #refallocate ( #allocateInit ( valcl ( 1 ) , #owner ( str ) , valcl ( "" ) , .ValueCLs ) ) , .ExpCLs ) |) } ) ;cl fun #cpath ( #owner ( #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) ) , join ) ( var ( 0 ) , .Idents ) { (| #wait ( *cl na var ( 0 ) .cl valcl ( 0 ) ) |) }  ;cl
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