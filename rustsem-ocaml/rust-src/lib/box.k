
requires "../srust-syntax.k"

module BOX

imports SRUST-SYNTAX

rule Box :: new (expTy(E:Exp, T:RType))
     	 => expTy(rallocate(own(T); exptylist(expTy(E,T), .ExpTys)), own(T))

endmodule