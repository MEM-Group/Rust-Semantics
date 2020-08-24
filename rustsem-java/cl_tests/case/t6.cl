

casecl {
    valcl(true) ==cl valcl(false) -> casecl { valcl(0) -> valcl(1);
    	     	 	     	      valcl(1) -> valcl(2)} ;

    valcl(1) <=cl valcl(0) -> casecl { valcl(0) -> valcl(3);
    	     	 	     	      valcl(1) -> valcl(4)} ;

    valcl(1) >=cl valcl(0) -> casecl { valcl(0) -> valcl(5);
    	     	 	     	      valcl(1) -> valcl(6)}


}