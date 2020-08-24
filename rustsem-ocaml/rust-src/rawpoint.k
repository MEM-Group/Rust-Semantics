
require "tydef.k"
require "srust-syntax.k"

module RAWPOINT

imports SRUST-SYNTAX
imports TYDEF


rule lhsTy(E:Exp, raw(T:RType)). I:Int => lhsTy(E. I, T)


endmodule