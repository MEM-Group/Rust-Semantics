
#allocateInit(2,i32,valcl(1),valcl(2))
#allocateInit(2,i32,valcl(1),valcl(2))
#allocateInit(3,i32,valcl(1),valcl(2),valcl(3))


#allocStack

#allocStack

#allocStack

#write(#sl(0),#own(#blk(0)))

#write(#sl(1),#Mut(#sl(0)))

#read(#sl(1))

#write(#sl(2), #Mut(#sl(0)))

#read(#sl(2))   

#read(#sl(1))  //error, lifetimes intersect
