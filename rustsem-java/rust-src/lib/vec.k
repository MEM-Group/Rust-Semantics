
require "../tydef.k"
require "../srust-syntax.k"

module VEC

imports TYDEF
imports SRUST-SYNTAX
imports CONFIGURATION


rule <k> vec! [#exptylist(#expTy(E:Exp,T:CoreTy), Es:ExpTys)] =>
     	      		#rallocate(#vec(T); #exptylist(#expTy(E,T), Es)) ... </k>

rule #expTy(E:Exp,#owner(#vec(T)))[ #expTy(E1:Exp, i32) ] => #expTy(#RIndex(E,E1),T)





endmodule


