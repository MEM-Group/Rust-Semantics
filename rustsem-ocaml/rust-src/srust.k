
/*
require "srust-syntax.k"
require "configuration.k"
require "compty.k"
require "lfunction.k"
require "llifetime.k"
require "lexpression.k"
require "rawpoint.k"
require "lib/rmap.k"
require "lib/box.k"
*/

require "configuration.k"
require "lfunction.k"
require "compty.k"
require "lstatement.k"
require "clang_op/clang.k"
require "renum.k"
require "traits.k"
require "pmatching.k"
require "tydef.k"
require "lclosure.k"
require "lib/rarray.k"
require "lib/vec.k"
require "lib/mem.k"

module SRUST

imports TYDEF
imports SRUST-SYNTAX
imports CONFIGURATION
imports LFUNCTION
imports COMPTY
imports LSTATEMENT
imports CLANG
imports RENUM
imports TRAITS
imports PMATCHING
imports LCLOSURE
imports RARRAY
imports VEC
imports MEM
imports COLLECTIONS

/*
imports LFUNCTION
imports LLIFETIME
imports LEXPRESSION
imports RENUM
imports RAWPOINT
imports VEC
imports MEM
imports RMAP
imports BOX


*/

rule D:Decl Ds:Decls => D ~> Ds

rule .Decls => .

rule <k> . => . </k>
     <tstack> ListItem (C1) ListItem(C2) => ListItem( #unwrapExpCL(C1) ;cl #unwrapExpCL(C2) ) ... </tstack>

rule <k> . =>  #unwrapExpCL(C) ;cl callcl(main, .ExpCLs) </k>
     <tstack> ListItem(C) </tstack>






endmodule



