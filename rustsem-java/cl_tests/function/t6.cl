
fun sum(x) {
    ifcl (x ==cl valcl(0) ) thencl (x +cl callcl(sum, x -cl valcl(1) ))
    elsecl valcl(0)
}

;cl

callcl(sum, valcl(10))

