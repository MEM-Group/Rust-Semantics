
fun f( var(1) ) {
    casecl {
    	 var(1) ==cl valcl(0) -> valcl(0) ;
	 var(1) >=cl valcl(0) -> var(1) +cl callcl(f, var(1) -cl valcl(1))
    }
}
;cl

callcl(f, valcl(100))