
 fun sum ( var ( 0 ) )
         {(| letcl var ( 1 ) =cl valcl ( 0 ) incl
              letcl var ( 2 ) =cl var ( 0 ) incl (
                   #loop var ( 2 ) >=cl valcl ( 0 )
                 { (| var ( 1 ) :=cl var ( 1 ) +cl var ( 2 ) ;cl clskip ;cl clskip ;cl
                 var ( 2 ) :=cl var ( 2 ) -cl valcl ( 1 ) ;cl clskip ;cl clskip |) }             
                  ;cl
                 var ( 1 ) )
             |) }

        ;cl

         assertcl( callcl(sum, valcl(10) ) ==cl valcl(55))