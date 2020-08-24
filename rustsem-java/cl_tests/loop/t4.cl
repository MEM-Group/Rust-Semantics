
letcl s =cl valcl(5) incl (
      #loop s >=cl valcl(0) {
      	    letcl a =cl #allocate(valcl(1),i32) incl ( a .cl valcl(0) :=cl na s) ;cl
	    s :=cl s -cl valcl(1)
      }
)