
letcl var(0) =cl #allocateInit(valcl(1),i32, valcl(3)) incl (
      letcl var(1) =cl refcl(1,var(0)) incl
      	    letcl var(2) =cl refcl(0,(*cl na var(1)) .cl valcl(0)) incl clskip
)