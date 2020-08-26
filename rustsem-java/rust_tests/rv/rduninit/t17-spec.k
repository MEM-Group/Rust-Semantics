
module T17-SPEC

import CLANG
import VEC-PATTERN
import INT_LIST

rule
    <T>
     <threads>
        <Thread>
         <threadId> 0 </threadId>
         <tname> "main" </tname>
         <k> ( fun main ( .Idents ) { (| letcl var ( 1 ) =cl callcl ( #cpath ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , new ) , .ExpCLs ) incl ( callcl ( #cpath ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , read ) , refcl ( 0 , var ( 1 ) ) , .ExpCLs ) ;cl clskip ) |) } ;cl fun #cpath ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , read ) ( var ( 0 ) , .Idents ) { (| ( *cl na var ( 0 ) .cl valcl ( 0 ) ) .cl valcl ( 0 ) ;cl clskip |) } ) ;cl fun #cpath ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , new ) ( .Idents ) { (| #AllocateInit ( valcl ( 2 ) , #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) , #Allocate ( valcl ( 2 ) , #TyUndef ) , valcl ( 0 ) , .ExpCLs ) |) }  ;cl
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
