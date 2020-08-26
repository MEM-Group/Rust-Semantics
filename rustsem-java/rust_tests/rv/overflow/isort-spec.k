import CLANG
import VEC-PATTERN
import INT_LIST

rule
    <T>
     <threads>
        <Thread>
         <threadId> 0 </threadId>
         <tname> "main" </tname>
         <k> ( fun main ( .Idents ) { (| letcl var ( 8 ) =cl #AllocateInit ( valcl ( 7 ) , #vec ( i32 ) , valcl ( 4 ) , valcl ( 5 ) , valcl ( 6 ) , valcl ( 7 ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , .ExpCLs ) incl ( callcl ( insertion_sort , refcl ( 1 , var ( 8 ) ) , valcl ( 8 ) , .ExpCLs ) ;cl clskip ) |) } ;cl fun insertion_sort ( var ( 4 ) , var ( 5 ) , .Idents ) { (| letcl var ( 6 ) =cl valcl ( 1 ) incl ( #loop var ( 6 ) <-cl var ( 5 ) { (| letcl var ( 7 ) =cl #Index ( *cl na var ( 4 ) , var ( 6 ) ) incl ( callcl ( insert , var ( 4 ) , var ( 6 ) , var ( 7 ) , .ExpCLs ) ;cl clskip ;cl var ( 6 ) :=cl var ( 6 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip ) |) } ;cl clskip ) |) } ) ;cl fun insert ( var ( 0 ) , var ( 1 ) , var ( 2 ) , .Idents ) { (| letcl var ( 3 ) =cl var ( 1 ) -cl valcl ( 1 ) incl ( #loop var ( 3 ) >=cl valcl ( 0 ) { (| ifcl #Index ( *cl na var ( 0 ) , var ( 3 ) ) <=cl var ( 2 ) thencl (| clskip |) elsecl (| #break |) ;cl clskip ;cl clskip ;cl #Index ( *cl na var ( 0 ) , var ( 3 ) +cl valcl ( 1 ) ) :=cl sc #Index ( *cl na var ( 0 ) , var ( 3 ) ) ;cl clskip ;cl clskip ;cl var ( 3 ) :=cl var ( 3 ) -cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl #Index ( *cl na var ( 0 ) , var ( 3 ) +cl valcl ( 1 ) ) :=cl sc var ( 2 ) ;cl clskip ;cl clskip ) |) }  ;cl
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
