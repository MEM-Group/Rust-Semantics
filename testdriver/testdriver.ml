







open Str;;
open String;;

let search_index r s = try search_forward r s 0 with Not_found -> -1 ;;

let main s = let ic = stdin in
let ic1 = open_in (s^".result") in 
           try 
                while true; do
let line = input_line ic in
    let bi = search_index (regexp "<k>") line in
if bi <> -1 then (let resu = input_line ic1 in let c = input_line ic in (if (search_index (regexp resu) c <> -1 )
			  then print_string ("\tThe test "^s^"-succeed\n") else print_string ("\tThe test "^s^"-fail\n")); exit 0) else ()
 done
           with End_of_file -> close_in ic1;;

main Sys.argv.(1) ;;




