

allocate(valcl(5), i32) ;cl
//the following operation should be stuck since offset 6 is greater than the block size
#offset(location(0,0),valcl(6))
