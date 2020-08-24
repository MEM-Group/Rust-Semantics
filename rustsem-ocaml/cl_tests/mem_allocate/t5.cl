

#allocate(valcl(5), i32) ;cl
#writena(#heap(0,0),valcl(1)) ;cl
#allocate(valcl(2), i32) ;cl
#writena(#heap(0,1),valcl(2)) ;cl
#writena(#heap(0,2),valcl(3)) ;cl
#allocate(valcl(10), #owner(#vec(i32))) 
