
require "../tydef.k"
require "../srust-syntax.k"

module RARRAY

imports TYDEF
imports SRUST-SYNTAX
imports CONFIGURATION

rule <k> #rallocate([T:RSType; S:Int])
			=> #expTy(#arrayExp(S),#owner(#array(#RStoCT(T,Rho),S))) ... </k>
     <typeCtx> Rho:Map </typeCtx>

rule #expTy(E:Exp, #owner(#array(T:CoreTy,N:Int))) . I:Int => #expTy(E. I, T)

rule #expTy(E:Exp, #owner(#array(T:CoreTy,N:Int))) [#expTy(I:Exp,i32)] => #expTy(#RIndex(E,I), T)

rule #lhsTy(E:Exp, #owner(#array(T:CoreTy,N:Int))) . I:Int => #lhsTy(E. I, T) 

rule <k> [#exptylist(#expTy(E:Exp,T:CoreTy), Es:ExpTys)] =>
     		#expTy(#rallocate(#owner(#array(#RStoCT(T,Rho), #sizeofExps(#exptylist(#expTy(E,T),Es)))) ; 
			#exptylist(#expTy(E,T),Es)), #owner(#array(#RStoCT(T,Rho),
				#sizeofExps(#exptylist(#expTy(E,T),Es))))) ... </k>
     <typeCtx> Rho:Map </typeCtx>





endmodule

