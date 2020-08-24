

allocate(valcl(5),i32) ;cl

allocate(valcl(6),i32) ;cl

writesc(address(0),0,valcl(1)) ;cl
writena(address(0),1,valcl(2)) ;cl
writesc(address(0),2,valcl(3)) ;cl
writesc(address(0),3,valcl(4)) ;cl
writena(address(0),4,valcl(5)) ;cl

#reallocate(location(0,0), valcl(6)) ;cl

writena(address(0),5,valcl(6)) ;cl

#memcopy(location(0,0),location(1,0),valcl(6)) 
