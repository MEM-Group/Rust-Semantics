
require "tydef.k"

module RENUM

imports SRUST-SYNTAX
imports TYDEF
imports TRAITS

syntax Fields
       ::= #pEnumElemsI(Ident, Ident, Fields, EnumElems)
         | #pEnumElems(Ident, Fields, EnumElems)

rule <k> enum N:Ident { Es:EnumElems }
     	      => #pEnumElems(N, .Fields ,Es) ... </k>

//#penum(N,#extractTys(Es,Rho)) ... </k>
     <typeCtx> Rho:Map </typeCtx>

rule enum N:Ident <_:GParams> {Es:EnumElems} => enum N {Es}

rule #penum(N:Ident, Ts:Fields) => N :=: #IdTy(N, #sum(Ts))

// ~> #setSumField(N,Ts,0)

/*
rule <k> #setSumField(N:Ident, #fd(X,T:CoreTy), Ts:Fields, I:Int)
     	 		       			=> #setSumField(N,Ts,I +Int 1) ... </k>
     <f2type> .Map => #fenum(N,X) |-> I ... </f2type>

rule #setSumField(N:Ident, .Fields, I:Int) => .
*/

syntax Fields
       ::= #extractTys(EnumElems,Map)		[function]
         | #extractTys1(TypeIds,Map)		[function]

syntax RustItem
       ::= setField2Tys(Ident, TypeIds, Int)


rule #extractTys(X:Ident {_:TypeIds}, Es:EnumElems, M:Map)
     	 => #Fields(#fd(X,#owner(#IdTy(X,#unwrapCoreTy(M[X])))), #extractTys(Es,M))
     
rule #extractTys(X:Ident, Es:EnumElems,M:Map)
     	    => #Fields(#fd(X, #owner(#IdTy(X,#prod(.Fields)))), #extractTys(Es,M)) 

rule #extractTys(X:Ident (Ts:RSTypes), Es:EnumElems, M:Map)
     	    => #Fields(#fd(X, #owner(#IdTy(X,#unwrapCoreTy(M[X])))), #extractTys(Es,M)) 

rule #extractTys(.EnumElems,M:Map) => .Fields

rule #extractTys1(X:Ident : T:RSType, Ts:TypeIds, M:Map)
     			      => #Fields(#fd(X,#RStoCT(T,M)), #extractTys1(Ts,M))




rule #extractTys1(.TypeIds,_:Map) => .Fields

rule #pEnumElems(N:Ident, Fs:Fields, T:Ident {Ts:TypeIds}, Es:EnumElems)
     			  => T {Ts} ~> #pEnumElemsI(N,T,Fs,Es)

rule <k> #pEnumElemsI(N:Ident, T:Ident, Fs:Fields, Es:EnumElems)
     			  => #pEnumElems(N, #addTailFields(#fd(T,C), Fs), Es) ... </k>
     <typeCtx> ... T |-> C:CoreTy ... </typeCtx>

syntax Fields
       ::= #addTailFields(Field, Fields)	[function]

rule #addTailFields(F:Field, .Fields) => #Fields(F, .Fields)

rule #addTailFields(F:Field, #Fields(H:Field,Fs:Fields)) => #Fields(H,#addTailFields(F,Fs))

rule #pEnumElems(N:Ident, Fs:Fields, .EnumElems) => N :=: #IdTy(N,#sum(Fs))

rule #pEnumElems(N:Ident, Fs:Fields, #enumElem1(T:Ident, Ts:RSTypes), Es:EnumElems)
     		          => #enumElem1(T,Ts) ~> #pEnumElemsI(N, T, Fs, Es)
				     
rule #pEnumElems(N:Ident, Fs:Fields, T:Ident, Es:EnumElems)
     			  => #enumElem1(T,.RSTypes) ~> #pEnumElemsI(N,T,Fs,Es)


//rule #pEnumElems(.EnumElems) => .


rule <k> X:Ident { Ts:TypeIds } =>
     	   X :=: #IdTy(X, #prod(#extractTys1(Ts,M))) ... </k> 
     <typeCtx> M:Map </typeCtx>

syntax Fields
       ::= #ty2fd(CoreTys)		[function]

rule #ty2fd(T:CoreTy, Cs:CoreTys) => #Fields(#fd(#noName, T), #ty2fd(Cs))
rule #ty2fd(.CoreTys) => .Fields

rule <k> #enumElem1(X:Ident, Ts:RSTypes) =>
     	 		     X :=: #IdTy(X, #prod( #ty2fd( #RStoCTs(Ts,M) ) ) ) ... </k>
     <typeCtx> M:Map </typeCtx>


//rule struct X:Ident <_:GParams> {Ts:TypeIds} => struct X {Ts}

rule struct X:Ident <_:GParams> {Ts:TypeIds} => struct X {Ts}
rule struct X:Ident {Ts:TypeIds} => X {Ts}

rule <k> struct X:Ident (Ts:RSTypes)
     	       => X :=: #IdTy(X,#prod(#ty2fd(#RStoCTs(Ts,M)))) ... </k>
     <typeCtx> M:Map </typeCtx>



endmodule