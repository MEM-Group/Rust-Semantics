


open Str;;
open String;;

let search_index r s = try search_forward r s 0 with Not_found -> -1 ;;



let main2 s =
  let result = ref "" in 
let ic = open_in (s) in
   try 
        while true; do
            let line = input_line ic in
let bi = search_index (regexp "Maximum resident") line in
   let bi1 = search_index (regexp "): ") line in 
           if (bi <> -1) then (
		     result := (!result) ^ ((sub line (bi1+3) ((length line) - bi1 - 3))^"\n")
		  )  else ()
 done
           with End_of_file -> print_string !result; close_in ic;;





let main s =
  let result = ref "" in 
let ic = open_in (s) in
   try 
        while true; do
            let line = input_line ic in
let bi = search_index (regexp "Elapsed") line in
   let bi1 = search_index (regexp "): ") line in 
           if (bi <> -1) then (
		     result := (!result) ^ ((sub line (bi1+5) 5)^"\n")
		  )  else ()
 done
           with End_of_file -> print_string !result; close_in ic;;


main Sys.argv.(1) ;;
main2 Sys.argv.(1);;



