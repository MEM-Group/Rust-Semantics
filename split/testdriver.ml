


open Str;;
open String;;

let search_index r s = try search_forward r s 0 with Not_found -> -1 ;;

let main s =
  let result = ref "" in 
let ic = open_in (s) in
   try 
        while true; do
            let line = input_line ic in
let bi = search_index (regexp "Elapsed") line in
let bi1 = search_index (regexp "Maximum resident") line in
                  if (bi <> -1) || (bi1 <> -1) then (
		     result := (!result) ^ (line^"\n")
		  )  else ()
 done
           with End_of_file -> print_string !result; close_in ic;;

main Sys.argv.(1) ;;




