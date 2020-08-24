
letcl var ( 0 ) =cl #allocate(valcl(3), i32) incl
(
*cl na var(0) :=cl na valcl(2) ;cl
casecl {
       *cl na var( 0 ) +cl valcl(1) ==cl valcl(1) -> var(0) .cl valcl(0) :=cl na valcl(2) ;
       *cl na var( 0 ) +cl valcl(1) ==cl valcl(2) -> var(0) .cl valcl(1) :=cl na valcl(2) ;
       *cl na var( 0 ) +cl valcl(1) ==cl valcl(3) -> var(0) .cl valcl(2) :=cl na valcl(2) 
 })