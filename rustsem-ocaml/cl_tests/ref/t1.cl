
letcl var(0) =cl valcl(2) incl (
      letcl var(1) =cl refcl(0,var(0)) incl (
      letcl var(2) =cl refcl(0,var(1)) incl (
      letcl var(3) =cl refcl(0,var(2))  incl (
      #print("{}", *cl na (*cl na (*cl na var(3))) )
))))