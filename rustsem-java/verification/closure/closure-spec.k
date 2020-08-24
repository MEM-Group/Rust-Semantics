

module CLOSURE-SPEC

imports CLANG

rule <T>
       <threads>
	<Thread>
	 <threadId> 0 </threadId>
	 <tname> "main" </tname>
	 <k>
letcl var ( 0 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( N1:Int ) , .ExpCLs ) incl letcl var ( 1 ) =cl valcl ( N4:Int ) incl letcl var ( 8 ) =cl #AllocateInitRaw ( valcl ( 2 ) , #owner ( #closureTy ( #envId ( 0 ) , fnTy ( i32 , .CoreTys ) -> i32 ) ) , #AllocateInit ( valcl ( 2 ) , #IdTy ( #env ( 0 ) , #prod ( #fd ( y , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , #fd ( b , i32 ) , .Fields ) ) , #move ( var ( 0 ) ) , var ( 1 ) , .ExpCLs ) , fun funId ( 0 ) ( var ( 2 ) , var ( 3 ) , .Idents ) { letcl var ( 4 ) =cl #move ( var ( 2 ) .cl valcl ( 0 ) ) incl letcl var ( 5 ) =cl var ( 2 ) .cl valcl ( 1 ) incl letcl var ( 6 ) =cl #move ( var ( 4 ) ) incl letcl var ( 7 ) =cl var ( 6 ) .cl valcl ( 0 ) +cl var ( 3 ) +cl var ( 5 ) incl var ( 7 ) } , .ValueCLs ) incl ( var ( 1 ) :=cl valcl ( N2:Int ) ;cl clskip ;cl clskip ;cl assertcl ( callcl ( var ( 8 ) .cl valcl ( 1 ) , var ( 8 ) .cl valcl ( 0 ) , valcl ( N3:Int ) , .ExpCLs ) ==cl valcl ( N1 +Int N3 +Int N4 ) ) )

      	 </k>
	 (.Bag => _)
      <env> .Map => ENVL:Map
      </env>
      <clstack> .List => L:List </clstack>
      </Thread>
	(.Bag => _)
      <activeThreads> SetItem(0)  </activeThreads>
      <cntThreads> 1:Int => _ </cntThreads>
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
   




endmodule


