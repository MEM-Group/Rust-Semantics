
//This is to test that it ways select the first true branch

letcl var(1) =cl valcl(9) incl
casecl {
       var (1) ==cl valcl(9) -> valcl(1) ;
       var (1) >=cl valcl(9) -> valcl(2) ;
       var (1) <-cl valcl(9) -> valcl(3) 
}