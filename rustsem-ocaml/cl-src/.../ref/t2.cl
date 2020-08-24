
letcl var(0) =cl #allocate(valcl(1),i32) incl (
      letcl var(1) =cl #allocate(valcl(2),i32) incl (
        letcl var(2) =cl clskip incl (
      casecl {
      	    valcl(1) -> var(2) :=cl refcl(var(0)) ;
	    valcl(0) -> var(2) :=cl refcl(var(1))
      } ;cl
      var(2)
      )
))