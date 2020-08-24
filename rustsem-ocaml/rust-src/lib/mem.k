

module MEM

imports TYDEF
imports SRUST-SYNTAX


rule _Rust_memcpy(E1:ExpTy, E2:ExpTy, E3:ExpTy) => #expTy(_Rust_memcpy(E1,E2,E3), #void)

rule #intrinsicDeallocate(E:ExpTy) => #expTy(#intrinsicDeallocate(E),#void)

rule #intrinsicWrite(E1:ExpTy,E2:ExpTy) => #expTy(#intrinsicWrite(E1,E2), #void)

rule #intrinsicRead(E1:ExpTy) => #expTy(#intrinsicRead(E1), #void)

rule _Rust_reallocate(E1:ExpTy,E2:ExpTy) => #expTy(_Rust_reallocate(E1,E2),#void)

rule #forget(E:ExpTy) => #expTy(#forget(E),#void)

rule #offsetr(E1:ExpTy,E2:ExpTy) => #expTy(#offsetr(E1,E2), #void)


endmodule