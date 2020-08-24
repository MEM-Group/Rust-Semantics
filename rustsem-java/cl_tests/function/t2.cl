
fun takeowner(x) {
    letcl var(0) =cl #allocate(valcl(1),i32) incl
    x :=cl na var(0)
}
;cl

letcl var(1) =cl #allocate(valcl(1),i32) incl
callcl(takeowner, var(1))