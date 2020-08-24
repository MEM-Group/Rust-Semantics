
require "tydef.k"
require "srust-syntax.k"
require "lfunction.k"

module TRAITS

imports TYDEF
imports SRUST-SYNTAX
imports LFUNCTION



rule <k> #traitsDef(TI:Id, T:CoreTy, (ifn F:Id (Ps:Idents) B:Block) Fs:FunDeclCs) =>
     	    #cpath(T,F) :=: fnTy(#replaceSelf(T,PT), PTs) -> RT
	        ~> ifn #cpath(T,F) (Ps) B ~> #traitsDef(TI,T,Fs) ... </k>
     <typeCtx> ... #cpath(#trait(TI),F) |-> fnTy(PT:CoreTy, PTs:CoreTys) -> RT:CoreTy ... </typeCtx>

rule #traitsDef(TI:Id, T:CoreTy, F:FunDeclC Fs:FunDeclCs) =>
     		       #renameFunDecl(T,F) ~>#traitsDef(TI,T,Fs)

rule <k> #traitsDefIdent(TI:Id, T:Ident, Fs:FunDeclCs)
     	 			=> #traitsDef(TI, #owner(CT), Fs:FunDeclCs) ... </k>
     <typeCtx> ... T |-> CT:CoreTy ...  </typeCtx>



rule #traitsDef(TI, T, .FunDeclCs) => .


rule trait T:Id { F:Id :=: FT:FnTy ; Ts:TraitElems } => #cpath(#trait(T),F) :=: FT ~> trait T { Ts }

rule trait T:Id { gtype X:Id ; Ts:TraitElems } => trait T { Ts }

rule <k> trait T:Id { fn X:Ident (Ps:RSTypes) -> RT:RSType ; Ts:TraitElems }
     	   	     => trait T { X :=: fnTy(#RStoCTs(Ps,M)) -> #RStoCT(RT,M); Ts } ...   </k>
     <typeCtx> M:Map </typeCtx>

rule trait T:Id {fn X:Ident (Ps:RSTypes) ; Ts:TraitElems} =>
     	   trait T:Id {fn X:Ident (Ps:RSTypes) -> #void ; Ts:TraitElems}

rule <k> trait T:Id {fn X:Ident (TS:TypeIds) -> RT:RSType ; Ts:TraitElems} =>
     	   trait T:Id {fn X:Ident (#exCoreTys(#second(#splitTyIds(TS,Rho))))
	   	 -> RT ; Ts:TraitElems} ... </k>
     <typeCtx> Rho:Map </typeCtx>


rule trait T:Id {fn X:Ident (TS:TypeIds) ; Ts:TraitElems} =>
     	   	    trait T {fn X (TS) -> #void ; Ts}

rule <k> trait T:Id {.TraitElems} => . ... </k>
     <typeCtx> .Map => T |-> #trait(T) ... </typeCtx>


syntax CoreTy
       ::= #replaceSelf(CoreTy, CoreTy)			[function]

rule #replaceSelf(T:CoreTy, #tyself) => T

//rule #replaceSelf(T:CoreTy, #ref(#tyself)) => #ref(#owner(T))
rule #replaceSelf(T:CoreTy,#trait(T1:Ident)) => #trait(T1)
rule #replaceSelf(T:CoreTy,#owner(T1:CoreTy)) => #owner(#replaceSelf(T,T1))
rule #replaceSelf(T:CoreTy,#ref(T1:CoreTy)) => #ref(#replaceSelf(T,T1))
rule #replaceSelf(T:CoreTy,i32) => i32
rule #replaceSelf(T:CoreTy,bool) => bool
rule #replaceSelf(T:CoreTy,str) => str
rule #replaceSelf(_,#ty(T)) => #ty(T)
rule #replaceSelf(_,#raw(T)) => #raw(T)
rule #replaceSelf(T:CoreTy,#array(T1:CoreTy,N:Int)) => #array(T1,N)


rule #tyMethodDecl1(T:CoreTy, F:FunDeclC Fs:FunDeclCs)
     			  	   => #renameFunDecl(T,F) ~> #tyMethodDecl1(T,Fs)
				   

rule <k> #tyMethodDecl1(#paramTys(T:Ident, Ts:TParams), #FunDecls(F:FunDeclC, Fs:FunDeclCs))
     			           => #renameFunDecl(#RStoCT(T,M), F)
				      ~> #tyMethodDecl1(#RStoCT(T,M),Fs) ... </k>
     <typeCtx> M:Map </typeCtx>
     requires T in keys(M)

rule <k> #tyMethodDecl1([T:RSType ; N:Int], Fs:FunDeclCs)
     	 		=>  #tyMethodDecl1(#owner(#array(#RStoCT(T,Rho),N)), Fs)  ... </k>
     <typeCtx> Rho:Map </typeCtx>
	


rule #tyMethodDecl1(T, .FunDeclCs) => .



rule <k> #tyMethodDecl1(T:Ident, F:FunDeclC Fs:FunDeclCs)
     			  	   => #renameFunDecl(#owner(TT),F) ~> #tyMethodDecl1(#owner(TT),Fs) ... </k>
     <typeCtx> ... T |-> TT:CoreTy ... </typeCtx>


syntax CoreTy
       ::= #implRS2R(RSType)




syntax FunDecl
       ::= #renameFunDecl(CoreTy, FunDeclC)	
         | #pReplaceSelf(K)

rule #renameFunDecl(T:CoreTy, unsafe F:FunDecl) => #renameFunDecl(T,F)

rule #renameFunDecl(T:CoreTy, fn F:Id <_:GParams> (Ts:TypeIds) B:Block)
     	  => #insertProcess(fn #cpath(T,F) (Ts) -> #void  B, #pReplaceSelf(#cpath(T,F)))

rule #renameFunDecl(T:CoreTy, fn F:Id (Ts:TypeIds) B:Block)
     			     => #insertProcess(fn #cpath(T,F) (Ts) -> #void B, #pReplaceSelf(#cpath(T,F)))

rule #renameFunDecl(T:CoreTy, fn F:Id <_:GParams> (Ts:TypeIds) -> RT:RSType B:Block)
     		=> #insertProcess(fn #cpath(T,F) (Ts) -> RT B, #pReplaceSelf(#cpath(T,F)))

rule <k> #renameFunDecl(T:CoreTy, fn F:Id <_:GParams> (Ts:TypeIds) -> RT:Ident B:Block)
     			     => #insertProcess(fn #cpath(T,F) (Ts) -> #owner(#unwrapCoreTy(Rho[RT])) B, #pReplaceSelf(#cpath(T,F))) ... </k>
     <typeCtx> Rho:Map </typeCtx>

rule <k> #renameFunDecl(T:CoreTy, fn F:Id (Ts:TypeIds) -> RT:Ident B:Block)
     			     => #insertProcess(fn #cpath(T,F) (Ts) -> #owner(#unwrapCoreTy(Rho[RT])) B, #pReplaceSelf(#cpath(T,F))) ... </k>
     <typeCtx> Rho:Map </typeCtx>
     requires RT in keys(Rho)

rule <k> #renameFunDecl(T:CoreTy, fn F:Id (Ts:TypeIds) -> RT:Ident B:Block)
          => #insertProcess(fn #cpath(T,F) (Ts) -> #ty(RT) B, #pReplaceSelf(#cpath(T,F))) ... </k>
     <typeCtx> Rho:Map </typeCtx>
     requires notBool (RT in keys(Rho))


rule #renameFunDecl(T:CoreTy, fn F:Id (Ts:TypeIds) -> RT:RSType B:Block)
     			     => #insertProcess(fn #cpath(T,F) (Ts) -> RT B, #pReplaceSelf(#cpath(T,F)))


rule <k> #pReplaceSelf(#cpath(T1:CoreTy,F:Id)) => . ... </k>
     <typeCtx> ...
         #cpath(T1,F) |-> fnTy((T:CoreTy => #replaceSelf(T1,T)), Ts:CoreTys) -> RT:CoreTy ...
     </typeCtx>


rule <k> #pReplaceSelf(#cpath(T1:CoreTy,F:Id)) => . ... </k>
     <typeCtx> ... #cpath(T1,F) |-> fnTy(.CoreTys) -> RT:CoreTy ... </typeCtx>




endmodule


