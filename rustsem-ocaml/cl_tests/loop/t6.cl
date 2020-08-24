
letcl s =cl valcl(5) incl (
      #loop s >=cl valcl(0) {
      	    letcl a =cl #allocate(valcl(1),i32) incl (*cl na a :=cl na s) ;cl
	    s :=cl s -cl valcl(1) ;cl #break
      }
)