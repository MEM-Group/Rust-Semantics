
#allocateInit(2,i32,valcl(1),valcl(2))
#allocateInit(4,i32,valcl(1),valcl(2),valcl(4),#shr(1,2,#sl(1)))
#allocateInit(3,i32,valcl(1),valcl(2),valcl(3))


#allocStack

#allocStack

#allocStack

#write(#sl(0),#own(#blk(0)))
#write(#sl(1),#Shr(#sl(0)))
#write(#sl(2),#Mut(#sl(0)))

#write(#dRef(#sl(1)),#Shr(#sl(0)))

