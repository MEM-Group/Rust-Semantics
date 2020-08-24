

module TRAIT-SPEC

imports CLANG

rule <T>
       <threads>
	<Thread>
	 <threadId> 0 </threadId>
	 <tname> "main" </tname>
	 <k>

fun #cpath ( #owner ( #IdTy ( Ppoint , #prod ( #fd ( x , i32 ) , #fd ( y , i32 ) , .Fields ) ) ) , distance ) ( var ( 2 ) , .Idents ) { (| letcl var ( 3 ) =cl #uninit ( 0 ) incl ( ifcl *cl na var ( 2 ) .cl valcl ( 0 ) <-cl valcl ( 0 ) thencl (| var ( 3 ) :=cl *cl na var ( 2 ) .cl valcl ( 0 ) ;cl clskip |) elsecl (| var ( 3 ) :=cl valcl ( 0 ) -cl *cl na var ( 2 ) .cl valcl ( 0 ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl ifcl *cl na var ( 2 ) .cl valcl ( 1 ) <-cl valcl ( 0 ) thencl (| var ( 3 ) :=cl var ( 3 ) +cl *cl na var ( 2 ) .cl valcl ( 1 ) ;cl clskip |) elsecl (| var ( 3 ) :=cl var ( 3 ) +cl ( valcl ( 0 ) -cl *cl na var ( 2 ) .cl valcl ( 1 ) ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl var ( 3 ) ) |) } ;cl

fun #cpath ( #owner ( #IdTy ( Lpoint , #prod ( #fd ( x , i32 ) , .Fields ) ) ) , distance ) ( var ( 0 ) , .Idents ) { (| letcl var ( 1 ) =cl #uninit ( 0 ) incl ( ifcl *cl na var ( 0 ) .cl valcl ( 0 ) <-cl valcl ( 0 ) thencl (| var ( 1 ) :=cl *cl na var ( 0 ) .cl valcl ( 0 ) ;cl clskip |) elsecl (| var ( 1 ) :=cl valcl ( 0 ) -cl *cl na var ( 0 ) .cl valcl ( 0 ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl var ( 1 ) ) |) } 

;cl


letcl var ( 4 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( Lpoint , #prod ( #fd ( x , i32 ) , .Fields ) ) , valcl ( N1:Int ) , .ExpCLs ) incl ( assertcl ( callcl ( #cpath ( #owner ( #IdTy ( Lpoint , #prod ( #fd ( x , i32 ) , .Fields ) ) ) , distance ) , refcl ( 0 , var ( 4 ) ) , .ExpCLs ) ==cl valcl ( N1 ) )) ;cl

letcl var ( 5 ) =cl #AllocateInit ( valcl ( 2 ) , #IdTy ( Ppoint , #prod ( #fd ( x , i32 ) , #fd ( y , i32 ) , .Fields ) ) , valcl ( N2:Int ) , valcl ( N3:Int ) , .ExpCLs ) incl assertcl ( callcl ( #cpath ( #owner ( #IdTy ( Ppoint , #prod ( #fd ( x , i32 ) , #fd ( y , i32 ) , .Fields ) ) ) , distance ) , refcl ( 0 , var ( 5 ) ) , .ExpCLs ) ==cl valcl ( N2 +Int N3 ) )


=> #unit

     </k>
      <env> .Map => ENVL:Map
      </env>
      <clstack> .List => L:List </clstack>
      </Thread>
	(.Bag => _)
      <activeThreads> SetItem(0) </activeThreads>
      <cntThreads> 1:Int </cntThreads>
      <cthread> 0:Int </cthread>
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


