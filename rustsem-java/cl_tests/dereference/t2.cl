
letcl a =cl #allocateInit(valcl(3),i32,valcl(0)) incl
letcl b =cl #allocate(valcl(2),i32) incl
(a .cl valcl(0) :=cl na refcl(0, b) ;cl
 b .cl valcl(0) :=cl na valcl(5) ;cl
 assertcl((*cl na (a .cl valcl(0))) .cl valcl(0) ==cl valcl(5)))
