
letcl x1 =cl #allocateInit(valcl(1),i32,valcl(1)) incl (
  letcl x2 =cl #allocateInit(valcl(1),i32,valcl(2)) incl (
    letcl r1 =cl refcl(0,x1) incl (
        letcl r2 =cl refcl(1,x1) incl (
	      r1
	)
    )
  )
)