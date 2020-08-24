

allocate(valcl(5),i32) ;cl

writena(address(0),0,valcl(1)) ;cl
writena(address(0),1,valcl(2)) ;cl
writena(address(0),2,valcl(3)) ;cl
writena(address(0),3,valcl(4)) ;cl
writena(address(0),4,valcl(5)) ;cl

cas(address(0),0,valcl(1),valcl(6)) ;cl
cas(address(0),1,valcl(2),valcl(6)) ;cl
cas(address(0),2,valcl(3),valcl(6)) ;cl
cas(address(0),3,valcl(4),valcl(6)) ;cl
cas(address(0),4,valcl(5),valcl(6))