

letcl var(0) =cl #allocate(valcl(5),i32) incl (

letcl var(1) =cl #allocate(valcl(6),i32) incl (

#writena(#heap(0,0),valcl(1)) ;cl
#writena(#heap(0,1),valcl(2)) ;cl
#writena(#heap(0,2),valcl(3)) ;cl
#writena(#heap(0,3),valcl(4)) ;cl
#writena(#heap(0,4),valcl(5)) ;cl



#memcopy(var(0) .cl valcl(0), var(1) .cl valcl(0) , valcl(2)) ;cl

//Testing memcopy from the offset great than 0
#memcopy(var(0) .cl valcl(2), var(1) .cl valcl(2),valcl(3))

))