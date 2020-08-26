







open Str;;
open String;;

let pre = "import CLANG
import VEC-PATTERN
import INT_LIST

rule
    <T>
     <threads>
        <Thread>
         <threadId> 0 </threadId>
         <tname> \"main\" </tname>
         <k>" ;;


let post = " ;cl
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
  </T> \n" ;;

let search_index r s = try search_forward r s 0 with Not_found -> -1 ;;

let main s =
  let result = ref "" in 
let ic = open_in (s) in
   try 
        while true; do
            let line = input_line ic in
               let bi = search_index (regexp "<tstack>") line in
                  if bi <> -1 then (
		     while true; do
		       let line1 = input_line ic in (
						     let bi1 = search_index (regexp "</tstack>") line1 in
							 if bi1 = -1 then ( 
                       result := (! result) ^ line1; print_string (pre^(sub !result 18 ((length !result) - 19))^post)) else exit 0)
		     done
		  )  else ()
 done
           with End_of_file -> close_in ic;;

main Sys.argv.(1) ;;




