
fun sumn(n) {
    casecl {
    	n ==cl valcl(0) -> valcl(0) ;
	n >-cl valcl(0) -> n +cl callcl(sumn, n -cl valcl(1))
    }
}
;cl
callcl(sumn, valcl(100))