
require "tydef.k"
require "srust-syntax.k"

module CONFIGURATION

imports TYDEF
//imports SRUST-SYNTAX
import DOMAINS
//import MEMORY-SYNTAX
//import CLANG-SYNTAX




syntax Id
       ::= "Box"

syntax Rust

configuration
       <threads>
	  <Thread multiplicity="*">
	      <threadId> 0:Int </threadId>
	      <tname> "main":String </tname>
	      <k> $PGM:Rust </k>
	      <env> .Map </env>
	      <clstack> .List </clstack>		
	  </Thread>
	  <activeThreads> SetItem(0:Int) </activeThreads>
	  <cntThreads> 1:Int </cntThreads>
	  <cthread> 0:Int </cthread>
	</threads>

   	<closures>
	   <closureCnt> 0:Int </closureCnt>
           <funclosure> .Map </funclosure>
           <closure multiplicity="*">
               <crId> 0:Int </crId>
               <crContext> .K </crContext>
               <crParams> .K </crParams>
               <crBody> .K </crBody>
           </closure>
       </closures>

       <memory>
          <slocAddr> 0:Int </slocAddr>
          <sloc> .Map  </sloc>
          <blkAddr> 0:Int </blkAddr>
          <blocks>
	    .Map
          </blocks>
          <locRW> .Set </locRW>
          <memStatus> .Map </memStatus>
          <clk> 0:Int </clk>
       </memory>
       <output> .List  </output>


	/*@**************************************************************
		1. ty-trait maps each type to a trait.
	*****************************************************************/
	
	<TCContext>
	  <varCtx>
	     <varCnt> 0:Int </varCnt>
	     <vInfo> .Map  </vInfo>
	 </varCtx>
	 <typeCtx> .Map </typeCtx>
	
	 <cpable> SetItem(i32) SetItem(bool) </cpable>
	 <tcenv> .Map </tcenv>
	 <stackEnv> .List </stackEnv>
	 
	 <lifetime>
	  	<currentLft> 0:Int </currentLft>
	 </lifetime>
	<desugar>
	   <tstack> .List </tstack>
	   <closureId> 0:Int </closureId>
        </desugar>
       </TCContext>



endmodule

















