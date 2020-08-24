
letcl x =cl #allocateInit(valcl(1), i32, valcl(6)) incl (
      letcl y =cl refcl(0,x) incl (
            letcl z =cl #move(x) incl (
      	       *cl na y)
      )
)