
#allocateInit(2,i32,valcl(1),valcl(2))
#allocateInit(2,i32,valcl(1),valcl(2),valcl(4))
#allocateInit(3,i32,valcl(1),valcl(2),valcl(3))


#allocStack

#allocStack

#allocStack

#write(#sl(0),#own(#blk(0)))
#write(#sl(1),#Shr(#sl(0)))    //#sl( 1 ) borrows #sl(0) here

#write(#sl(0),#own(#blk(1)))   //#sl( 0 ) being written here

#read(#dRef(#sl(1)))           //#sl( 1 ) being used here

