

module INSERTSORT-SPEC

imports CLANG

rule <T>
       <threads>
	<Thread>
	 <threadId> 0 </threadId>
	 <tname> "main" </tname>
	 <k>


fun Vec_Order ( var ( 8 ) , var ( 9 ) , .Idents ) { (| letcl var ( 10 ) =cl valcl ( 1 ) incl letcl var ( 11 ) =cl valcl ( 0 ) incl ( #loop var ( 10 ) <-cl var ( 9 ) { (| ifcl #Index ( *cl na var ( 8 ) , var ( 10 ) -cl valcl ( 1 ) ) >-cl #Index ( *cl na var ( 8 ) , var ( 10 ) ) thencl (| clskip |) elsecl (| var ( 11 ) :=cl valcl ( 1 ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl var ( 10 ) :=cl var ( 10 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl #retcl ( var ( 11 ) ) ) |) } ;cl

fun insertion_sort ( var ( 4 ) , var ( 5 ) , .Idents ) { (| letcl var ( 6 ) =cl valcl ( 1 ) incl ( #loop var ( 6 ) <-cl var ( 5 ) { (| letcl var ( 7 ) =cl #Index ( *cl na var ( 4 ) , var ( 6 ) ) incl ( callcl ( insert , var ( 4 ) , var ( 6 ) , var ( 7 ) , .ExpCLs ) ;cl clskip ;cl var ( 6 ) :=cl var ( 6 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip ) |) } ;cl clskip ) |) } ;cl

fun insert ( var ( 0 ) , var ( 1 ) , var ( 2 ) , .Idents ) { (| letcl var ( 3 ) =cl var ( 1 ) -cl valcl ( 1 ) incl ( #loop var ( 3 ) >=cl valcl ( 0 ) { (| ifcl #Index ( *cl na var ( 0 ) , var ( 3 ) ) <=cl var ( 2 ) thencl (| clskip |) elsecl (| #break |) ;cl clskip ;cl clskip ;cl #Index ( *cl na var ( 0 ) , var ( 3 ) +cl valcl ( 1 ) ) :=cl sc #Index ( *cl na var ( 0 ) , var ( 3 ) ) ;cl clskip ;cl clskip ;cl var ( 3 ) :=cl var ( 3 ) -cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl #Index ( *cl na var ( 0 ) , var ( 3 ) +cl valcl ( 1 ) ) :=cl sc var ( 2 ) ;cl clskip ;cl clskip ) |) } 

;cl
 
letcl var ( 11 ) =cl #AllocateInit ( valcl ( size(L) ) , #vec ( i32 ), #List2ExpCLs(L)) incl (callcl ( insertion_sort , refcl ( 1 , var ( 11 ) ) , valcl ( size(L) ) , .ExpCLs ) 
;cl assertcl ( callcl ( Vec_Order , refcl ( 0 , var ( 11 ) ) , valcl ( size(L) ) , .ExpCLs ) ==cl valcl ( 0 ) ) )

         => #unit	  
         </k>
      <env> .Map => ENVL:Map
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
        (.Bag => CLOSURE:Bag)
   </closures>
    <memory>
        <slocAddr> 0:Int => SLOCADDR:Int </slocAddr>
        <sloc>
	  .Map => SLOC:Map
        </sloc>
        <blkAddr> 0:Int => BLKADDR:Int </blkAddr>
        <blocks>
           .Map => BLKS:Map
        </blocks>
        <locRW> .Set => LOCRW:Set </locRW>
        <memStatus> .Map => MEMS:Map </memStatus>
        <clk> 0:Int => CLKN:Int </clk>
    </memory>
    <output> .List </output>
</T>
  requires L ==K ListItem(N1:Int) ListItem(N2:Int) ListItem(N3:Int) ListItem(N4:Int)  .List




endmodule


