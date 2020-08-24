

fun f () {
    letcl var(0) =cl #allocate(valcl(1),#owner(i32)) incl (
    	  var(0) .cl valcl(0) :=cl na valcl(4) ;cl
	  #move(var(0))
    )
}
;cl

letcl t =cl callcl(f,) incl assertcl( t .cl valcl(0) ==cl valcl(4))