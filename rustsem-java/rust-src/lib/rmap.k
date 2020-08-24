
require "../tydef.k"
require "../srust-syntax.k"

module RMAP

imports TYDEF
imports SRUST-SYNTAX


rule #getTyId(#Map) => #Map

rule rallocate(#Map) => expTy(#heap(0,#Map),own(#Map))

rule #mapAdd(expTy(L:Exp,T:RType), expTy(K:Exp,T1:RType), expTy(V:Exp,T2:RType))
     		=> expTy(#mapAdd(expTy(L,T),expTy(K,T1),expTy(V,T2)), bool)

rule #mapKeyin(expTy(L:Exp,T:RType), expTy(K:Exp,T1:RType))
     		=> expTy(#mapKeyin(expTy(L,T),expTy(K,T1)), bool)

rule #mapValue(expTy(L:Exp,T:RType), expTy(K:Exp,T1:RType))
     		=> expTy(#mapValue(expTy(L,T),expTy(K,T1)), #TyUndef)


endmodule