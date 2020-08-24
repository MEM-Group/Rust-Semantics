

allocate(valcl(1),i32) ;cl
writena(address(0),0,valcl(3)) ;cl

//The following operation should be stuck since the value is 3 instead of
//4, therefore no swapping is performed
cas(address(0),0,valcl(4),valcl(6))