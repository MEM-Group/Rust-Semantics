
letcl x =cl #allocate(valcl(2), i32) incl (
      letcl y =cl #allocate(valcl(1), i32) incl (
      	    x .cl valcl(1) :=cl y ;cl
	    #deallocate(x .cl valcl(1)) ;cl
	    #deallocate(x)
      )
)