
fun #cpath(#owner(#IdTy(A,#prod(#fd(x,i32)))),f) (x,y) {
    ifcl (x .cl valcl( 0 ) ==cl valcl(true) ) thencl y elsecl (y +cl valcl(1))
}
;cl
letcl x =cl #allocateInit(valcl(1), #IdTy(A,#prod(#fd(x,i32))), valcl(true)) incl (
      pcallcl(x,f,#move(x),valcl(2))
)