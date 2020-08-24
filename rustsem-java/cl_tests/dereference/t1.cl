
letcl a =cl #allocate(valcl(3),i32) incl
( a .cl valcl(0) :=cl na valcl(23) ;cl
 assertcl( a .cl valcl(0) ==cl valcl(23))
)