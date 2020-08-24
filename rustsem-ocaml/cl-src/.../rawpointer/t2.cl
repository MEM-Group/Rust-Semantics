

letcl var(0) =cl #allocate(valcl(2), i32) incl
(
        var(0) .cl valcl(1) :=cl na valcl(3) ;cl
	letcl var(1) =cl var(0) .cl valcl(1) incl
	#print("{}",var(1))
)