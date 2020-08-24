
allocate(valcl(3),i32) ;cl

writena(address(0),0,valcl(1)) ;cl
writena(address(0),1,valcl(2)) ;cl
writena(address(0),2,valcl(3)) ;cl

assertcl(readsc(address(0),0) ==cl  valcl(1)) ;cl   
assertcl(readsc(address(0),1) ==cl valcl(2) ) ;cl
assertcl(readsc(address(0),2) ==cl valcl(3))  


