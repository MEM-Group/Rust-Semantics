

letcl var(0) =cl #allocate(valcl(5),i32) incl (
  letcl var(1) =cl #allocate(valcl(6),i32) incl (
    var(0) .cl valcl(0) :=cl valcl(1) ;cl
    var(0) .cl valcl(1) :=cl valcl(2) ;cl
    var(0) .cl valcl(2) :=cl valcl(3) ;cl
    #memcopy(var(0) .cl valcl(0) , var(1) .cl valcl(1), valcl(3))
 )
)