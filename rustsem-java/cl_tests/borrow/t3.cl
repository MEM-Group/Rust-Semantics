

letcl x =cl #allocate(valcl(1), i32) incl (
      letcl y =cl refcl(0,x) incl (
      	       (*cl na y) .cl valcl(0)
      )
)
