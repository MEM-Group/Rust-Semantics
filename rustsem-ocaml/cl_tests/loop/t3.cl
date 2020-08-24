

letcl x =cl #allocate(valcl(1), i32) incl (
      x .cl valcl(0) :=cl na valcl(6) ;cl
      #loop x .cl valcl(0) >=cl valcl(0) {x .cl valcl(0) :=cl na  x .cl valcl(0) -cl valcl(1)}
)