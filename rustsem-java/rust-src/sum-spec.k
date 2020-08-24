
module SUM-SPEC

imports CLANG

rule <T>
       <threads>
	<thread>
	 <threadId> 0 </threadId>
	 <tname> "main" </tname>
	 <k>
	 fun sum ( var ( 0 ) , var ( 1 ) , .Idents )
	 { (| #moveVal ( var ( 0 ) +cl var ( 1 ) , var ( 0 ) +cl var ( 1 ) ) |) } ;cl
	 letcl x =cl valcl(I:Int) incl
	 letcl y =cl valcl(J:Int) incl
	 letcl re =cl callcl(sum, x,y) incl
	 assertcl(x +cl y ==cl re) => #unit
   </k>
      <env> .Map </env>
      <clstack> .List </clstack>
      </thread>
      <cntThreads> 1:Int </cntThreads>
   </threads>

   <OPContext> 
   <closures>
	<closureCnt> N:Int => NT:Int  </closureCnt>
	<funclosure> .Map => Rho:Map </funclosure>
	(.Bag => _ )
   </closures>
        <memory>
	      <memaddress> K:Int => KP:Int </memaddress>
	        <blocks>
	     	 (.Bag => _) 
		</blocks>
	      <memorystatus> .Map => _ </memorystatus>
	      <cntmem> .Map </cntmem>
	  </memory>
   </OPContext>
       <tmpk> .K </tmpk>
       <cpable> SetItem(i32) SetItem(bool) </cpable>
       <output> .List </output>
     </T> 

endmodule
