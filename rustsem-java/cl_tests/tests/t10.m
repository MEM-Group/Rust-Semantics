
#allocateInit(valcl(2),i32,valcl(1),valcl(2)) ;cl
#allocateInit(valcl(3),i32,valcl(1),valcl(2),valcl(4)) ;cl
#allocateInit(valcl(3),i32,valcl(1),valcl(2),valcl(3)) ;cl
#allocStack
;cl
#allocStack
;cl
#allocStack
;cl
#write(#sl(0),#own(#blk(0)))
;cl
#write(#sl(1),#Mut(#sl(0)))
;cl
#read(#sl(1))
;cl
#write(#sl(2), #Mut(#sl(0)))
;cl
#read(#sl(2))   


