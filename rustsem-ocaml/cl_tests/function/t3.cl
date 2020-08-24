


fun takeref(x) {
    letcl var(0) =cl #allocate(valcl(1),i32) incl
    (*cl na x) .cl valcl(0) :=cl na var(0) ;cl
    x
}
;cl

letcl var(1) =cl #allocate(valcl(1),i32) incl
callcl(takeref, refcl(1, var(1)))