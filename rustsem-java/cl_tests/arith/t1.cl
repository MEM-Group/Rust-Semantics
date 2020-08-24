

assertcl(valcl(1) +cl valcl(2) ==cl valcl(3)) ;cl
assertcl(valcl(1) -cl valcl(2) ==cl valcl(-1)) ;cl
assertcl(valcl(1) *-cl valcl(3) ==cl valcl(3)) ;cl
assertcl(valcl(17) /-cl valcl(2) ==cl valcl(8)) ;cl
assertcl((valcl(1) ==cl valcl(2)) ==cl boolval(false)) ;cl
assertcl((valcl(1) <=cl valcl(2)) ==cl boolval(true)) ;cl
assertcl((valcl(1) <-cl valcl(2)) ==cl boolval(true)) ;cl
assertcl((valcl(1) >=cl valcl(2)) ==cl boolval(false)) ;cl
assertcl((valcl(1) >-cl valcl(2)) ==cl boolval(false)) ;cl
assertcl((valcl(1) modcl valcl(2)) ==cl valcl(1)) 
