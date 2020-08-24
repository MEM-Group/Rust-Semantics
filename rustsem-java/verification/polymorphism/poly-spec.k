

module POLY-SPEC

imports CLANG

rule <T>
       <threads>
	<thread>
	 <threadId> 0 </threadId>
	 <tname> "main" </tname>
	 <k>

fun caldistance ( var ( 4 ) , .Idents ) { (| pcallcl ( var ( 4 ) , distance , var ( 4 ) , .ExpCLs ) |) } ;cl

fun #cpath ( #owner ( #IdTy ( Ppoint , #prod ( #fd ( x , i32 ) , #fd ( y , i32 ) , .Fields ) ) ) , distance ) ( var ( 2 ) , .Idents ) { (| letcl var ( 3 ) =cl #uninit ( 0 ) incl ( ifcl *cl na var ( 2 ) .cl valcl ( 0 ) <-cl valcl ( 0 ) thencl (| var ( 3 ) :=cl *cl na var ( 2 ) .cl valcl ( 0 ) ;cl clskip ;cl clskip |) elsecl (| var ( 3 ) :=cl valcl ( 0 ) -cl *cl na var ( 2 ) .cl valcl ( 0 ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl ifcl *cl na var ( 2 ) .cl valcl ( 1 ) <-cl valcl ( 0 ) thencl (| var ( 3 ) :=cl var ( 3 ) +cl *cl na var ( 2 ) .cl valcl ( 1 ) ;cl clskip ;cl clskip |) elsecl (| var ( 3 ) :=cl var ( 3 ) +cl ( valcl ( 0 ) -cl *cl na var ( 2 ) .cl valcl ( 1 ) ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl var ( 3 ) ) |) } ;cl

fun #cpath ( #owner ( #IdTy ( Lpoint , #prod ( #fd ( x , i32 ) , .Fields ) ) ) , distance ) ( var ( 0 ) , .Idents ) { (| letcl var ( 1 ) =cl #uninit ( 0 ) incl ( ifcl *cl na var ( 0 ) .cl valcl ( 0 ) <-cl valcl ( 0 ) thencl (| var ( 1 ) :=cl *cl na var ( 0 ) .cl valcl ( 0 ) ;cl clskip ;cl clskip |) elsecl (| var ( 1 ) :=cl valcl ( 0 ) -cl *cl na var ( 0 ) .cl valcl ( 0 ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl var ( 1 ) ) |) }

;cl

letcl var ( 5 ) =cl #uninit ( 0 ) incl (
ifcl valcl ( 0 ) thencl (| letcl var ( 6 ) =cl #AllocateInit ( valcl ( 2 ) , #IdTy ( Ppoint , #prod ( #fd ( x , i32 ) , #fd ( y , i32 ) , .Fields ) ) , valcl ( N1:Int ) , valcl ( N2:Int ) , .ExpCLs ) incl ( var ( 5 ) :=cl callcl ( caldistance , refcl ( 0 , var ( 6 ) ) , .ExpCLs ) ;cl clskip ;cl clskip ;cl assertcl ( var ( 5 ) ==cl valcl ( N1 +Int N2 ) ) ) |) elsecl (|
letcl var ( 7 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( Lpoint , #prod ( #fd ( x , i32 ) , .Fields ) ) , valcl ( N3 ) , .ExpCLs ) incl ( var ( 5 ) :=cl callcl ( caldistance , refcl ( 0 , var ( 7 ) ) , .ExpCLs ) ;cl clskip ;cl clskip ;cl assertcl ( var ( 5 ) ==cl valcl ( N3 ) ) ) |))

		=> #unit
      	 </k>
	 (.Bag => _)
      <env> .Map => ENVL:Map
      </env>
      <clstack> .List => L:List </clstack>
      </thread>
	(.Bag => _)
      <activeThreads> SetItem(0) </activeThreads>
      <cntThreads> 1:Int => _ </cntThreads>
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
     requires N1 >=Int 0 andBool N2 >=Int 0 andBool N3 >=Int 0




endmodule


