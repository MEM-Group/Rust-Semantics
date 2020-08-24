
letcl x =cl #allocateInit(valcl(2),i32,valcl(1)) incl (
      letcl y =cl refcl(0,x) incl (
      	    letcl z =cl #RawCL(y) incl (
	    	  (*cl na z) .cl valcl(0) :=cl valcl(2)
	    )
      )
)