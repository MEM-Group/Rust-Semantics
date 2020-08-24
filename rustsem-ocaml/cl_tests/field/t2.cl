
letcl var(1) =cl #allocate(valcl(2),i32) incl (
var(1) .cl valcl(0)  :=cl na valcl(4) ;cl
var(1) .cl valcl(1)  :=cl na valcl(5) ;cl
assertcl(var(1) .cl valcl(0) ==cl valcl(4))
)