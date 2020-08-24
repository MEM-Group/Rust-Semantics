letcl var(1)=cl #allocateInitRaw(valcl(2),i32,valcl(0),valcl(1)) incl (
      letcl var(2) =cl #AllocateInit(valcl(2),i32,var(1),
            fun f(x) {letcl y =cl  x .cl valcl(1) incl valcl(4) } ) incl
      (#forkcl(valcl("x"), refcl(1,var(2))) ;cl
        var(1) .cl valcl(1) :=cl valcl(5)
      )
)
