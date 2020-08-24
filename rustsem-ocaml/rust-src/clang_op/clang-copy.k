 
require "clang-syntax.k"
require "memory.k"
require "sortindexcl.k"
//require "sortindex.k"

module CLANG

imports CLANG-SYNTAX
imports CONFIGURATION
imports MEMORY
imports SORTINDEXCL
imports FLOAT

syntax KResult
       ::= ValueCL
         | ValCLs

syntax OldVal
       ::= #oldVal(Ident, ValueCL)

syntax FnItem
       ::= fnCalls(Int, Idents, ValCLs)		
         | computeFunBody(K)  			[strict]
	 | lazyCall(ExpCL, ExpCLs)		[strict(1)]
	 | lazyCall1(Int, Idents, ExpCLs)	[strict(3)]
	 | callclP(ExpCL, ExpCLs, ExpCLs)	[strict(1,2)]
	 | #letclstmt(Ident, ValueCL, ExpCL)

syntax Int
       ::= #mustbeInt(K)	[function]

rule #mustbeInt(I:Int) => I


rule #updateRuleCnt(Rho:Map,I:Int) => Rho[I <- (#mustbeInt(Rho[I]) +Int 1)]
     requires I in keys(Rho)

rule #updateRuleCnt(Rho:Map,I:Int) => Rho[I <- 1:Int]
     requires notBool (I in keys(Rho))

rule <k> #letclstmt(X:Ident, V:ValueCL, E:ExpCL) => InitParam(X,V) ~> computeFunBody(E) ...  </k>
     <env> Rho:Map </env>
     <clstack> .List => ListItem(Rho) ... </clstack>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,1)  </ruleCnt>


rule <k> (| E:ExpCL |) => E ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,2)  </ruleCnt>

rule <k> #cvarcl(location(A:Int,O:Int)) => *cl na location(A,O) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,3)  </ruleCnt>


rule <k> #cvarcl(V:ValueCL) => V ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,3)  </ruleCnt>
     requires termIndex(V) =/=Int 10007

rule <k> #refallocate(L:Location) => #point(L) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,4)  </ruleCnt>

rule #drop(E:ExpCL) => E

rule <k> fun F:Ident ( P:Idents ) { E:ExpCL } => cr(C) ... </k>
     (.Bag => 
     	<closure>
	   <crId> C </crId>
	   <crContext> .K </crContext>
	   <crParams> P </crParams>
           <crBody> E </crBody>
	</closure>
     )
     <env> Rho:Map </env>
     <closureCnt> C:Int => C +Int 1 </closureCnt>
     <funclosure> .Map => F |-> C ...  </funclosure>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,5)  </ruleCnt>

rule <k> fun F:Ident [Env:Ident] ( P:Idents ) { E:ExpCL } => cr(C) ... </k>
     (.Bag => 
     	<closure>
	   <crId> C </crId>
	   <crContext> Env </crContext>
	   <crParams> P </crParams>
           <crBody> E </crBody>
	</closure>
     )
     <closureCnt> C:Int => C +Int 1 </closureCnt>
     <funclosure> .Map => F |-> C ...  </funclosure>


rule <k> fun ( P:Idents ) { E:ExpCL } => cr(C) ... </k>
     (.Bag => 
     	<closure>
	   <crId> C </crId>
	   <crContext> .K </crContext>
	   <crParams> P </crParams>
           <crBody> E </crBody>
	</closure>
     )
     <closureCnt> C:Int => C +Int 1 </closureCnt>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,7)  </ruleCnt>


rule <k> lazyCall(cr(I:Int),EL:ExpCLs) => lazyCall1(I,P,EL)  ... </k>
     <crId> I </crId>
     <crParams> P:Idents </crParams>
     <crContext> Rho:Map </crContext>
     <env> Rho1:Map => Rho1 Rho </env>
     <clstack> .List => ListItem(Rho1) ... </clstack>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,8)  </ruleCnt>


rule lazyCall1(I,P:Idents,VL:ValCLs) => fnCalls(I,P,VL)

syntax CLState
       ::= #state(K)

rule <k> callcl(cr(I:Int), VL:ValCLs) ~> RestPGM:K => fnCalls(I,P,VL) </k>
     <crId> I </crId>
     <crParams> P:Idents </crParams>
     <clstack> .List => ListItem(#state(RestPGM)) ... </clstack>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,9)  </ruleCnt>

syntax ItemFn
       ::= InitParam(Ident,ValueCL)


rule <k> fnCalls(I:Int, (X:Ident, RestP:Idents), #ValCLs(V:ValueCL, RestVl:ValCLs)) =>
     	 InitParam(X,V) ~> fnCalls(I,RestP,RestVl) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,10)  </ruleCnt>


rule <k> InitParam(#anonymous, _:ValueCL) => . ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,11)  </ruleCnt>


rule #list2Set(.List) => .Set
rule #list2Set(ListItem(E) L:List) => SetItem(E) #list2Set(L)

rule <k> InitParam(X:Ident, V:ValueCL) => . ... </k>
     <env> ENV:Map (.Map => X |-> V) </env>
     <clstack> .List => ListItem(X) ... </clstack>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,12)  </ruleCnt>
     requires notBool #inSet(X,keys(ENV))

rule <k> InitParam(X:Ident, V:ValueCL) => . ... </k>
     <env> ... X |-> (V1:ValueCL => V) ... </env>
     <clstack> .List => ListItem(#oldVal(X,V1)) ... </clstack>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,13)  </ruleCnt>

syntax Set
       ::= #extractInts(Set)	[function]

rule #extractInts(.Set) => .Set

rule #extractInts(SetItem(cr(I:Int)) S:Set) => SetItem(I) #extractInts(S)

rule #extractInts(SetItem(V:ValueCL) S:Set) => #extractInts(S)
     requires termIndex(V) =/=Int 10006


rule <k> fnCalls(I:Int, .Idents, .ValCLs) => computeFunBody(B) ... </k>
     <crId> I </crId>
     <crBody> B:ExpCL </crBody>
     <env> ME:Map </env>
     <funclosure> FE:Map </funclosure>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,14)  </ruleCnt>
     requires (#inSet(I, #extractInts(#list2Set(values(ME)))))
     	      	orBool (#inSet(I,#list2Set(values(FE))))
     

rule <k> fnCalls(I:Int, .Idents, .ValCLs) => computeFunBody(B) ... </k>
     (<closure>
	<crId> I </crId>
     	<crBody> B:ExpCL </crBody>
	...
     </closure> => .Bag)
     <env> ME:Map </env>
     <funclosure> FE:Map </funclosure>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,15)  </ruleCnt>
     requires (notBool (#inSet(I, #extractInts(#list2Set(values(ME))))))
     	      andBool (notBool (#inSet(I, #list2Set(values(FE)))))


rule <k> fnCalls(I:Int, (X:Ident, RestP:Idents), .ValCLs) => cr(C) ... </k>
     <closure>
	<crId> I </crId>
     	<crBody> E </crBody>
	...
     </closure>
     (.Bag => 
     	<closure>
	   <crId> C </crId>
	   <crContext> Rho </crContext>
	   <crParams> (X,RestP) </crParams>
           <crBody> E </crBody>
	</closure>
     )
     <closureCnt> C:Int => C +Int 1 </closureCnt>
     <env> Rho:Map => Rho1 </env>
     <clstack> ListItem(Rho1) => .List ... </clstack>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,16)  </ruleCnt>


rule <k> computeFunBody(V:ValueCL) => V ... </k> 
     <clstack> ListItem(Rho:Map) => .List ... </clstack>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,17)  </ruleCnt>
     requires V =/=K #breakVal

rule <k> computeFunBody(V:ValueCL) => V ~> RestPGM </k> 
     <clstack> ListItem(#state(RestPGM:K)) => .List ... </clstack>
    <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,18)  </ruleCnt>
     requires V =/=K #breakVal

rule <k> computeFunBody(#breakVal) => #breakVal ... </k> 
     <clstack> ListItem(Rho:Map) => .List ... </clstack>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,17)  </ruleCnt>

rule <k> computeFunBody(#breakVal) => #breakVal ~> RestPGM </k> 
     <clstack> ListItem(#state(RestPGM:K)) => .List ... </clstack>
    <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,18)  </ruleCnt>



syntax ExpCL
       ::= #moveC(ExpCL)	[strict]

rule <k> #moveVal(V:ValueCL,E:ExpCL) => #move(E) ;cl V ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,19)  </ruleCnt>

rule <k> #move(E:ExpCL) => #moveC(lhscl(E)) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,20)  </ruleCnt>

rule #forgetcl(E:ExpCL) => #moveC(lhscl(E))



rule <k> #moveC(lhsV(X:Ident)) => #unit ... </k>
     <env> ... X |-> (location(N:Int,O:Int) => #getMoveVal(location(N,O),T,S)) ... </env>
     <baddress> address(N) </baddress>
     <btype> T:CoreTy </btype>
     <cpable> S:Set </cpable>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,21)  </ruleCnt>

rule <k> #moveC(lhsV(X:Ident)) => #unit ... </k>
     <env> ... X |-> (location(N:Int,O:Int) => uninit(0) ) ... </env>
     <baddress> #freeA(N) </baddress>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,22)  </ruleCnt>



rule <k> #moveC(lhsV(X:Ident)) => #unit ... </k>
     <env> ... X |-> V:ValueCL ... </env>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,23)  </ruleCnt>
     requires termIndex(V) =/=Int 10007

rule <k> #moveC(lhsV(funId(I:Int))) => #unit ... </k>
          <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,24)  </ruleCnt>

rule <k> #moveC(location(A:Int,I:Int)) => #unit ... </k>
     <baddress> address(A) </baddress>
     <bstore> ... I |-> V:ValueCL ... </bstore>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,25)  </ruleCnt>
     requires termIndex(V) =/=Int 10007

rule <k> #moveC(location(A:Int,I:Int)) => #unit ... </k>
     <baddress> address(A) </baddress>
     <bstore> ... I |-> (location(N:Int,0) => #getMoveVal(location(N,0), T,S)) ... </bstore>
     <btype> T:CoreTy </btype>
     <cpable> S:Set </cpable>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,26)  </ruleCnt>



rule <k> #moveC(location(B:Int,K:Int)) => #unit ... </k>
     <block>
         <baddress> address(B) </baddress>
         <bstore> ... K |-> (location(N:Int,O:Int) => #getMoveVal(location(N,O),T,S)) ... </bstore>
	 ...
     </block>
     <block>
	<baddress> address(N) </baddress>
        <btype> T:CoreTy </btype>
	...
     </block>
     <cpable> S:Set </cpable>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,27)  </ruleCnt>


syntax ValueCL
       ::= #getMoveVal(ValueCL,CoreTy,Set)		[function]

rule #getMoveVal(location(N:Int,O:Int),T:CoreTy, S:Set) => location(N,O)
     requires #inSet(T,S)

rule #getMoveVal(location(N:Int,O:Int),T:CoreTy, S:Set) => uninit(0)
     requires notBool #inSet(T,S)

rule <k> #moveC(V:ValueCL) => #unit ... </k>
     requires (termIndex(V) =/=Int 10009) andBool (termIndex(V) =/=Int 10007)

syntax DestructItem
       ::= #destruct(ValueCL)

rule <k> computeFunBody(V:ValueCL) => #destruct(V1) ~> computeFunBody(V) ... </k> 
     <env> ... ((X |-> V1:ValueCL) => .Map) ...  </env>
     <clstack> ListItem(X:Ident) => .List ... </clstack>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,28)  </ruleCnt>

rule <k> computeFunBody(V:ValueCL) => #destruct(V1) ~> computeFunBody(V) ... </k> 
     <env> ... (X |-> (V1:ValueCL => OldV)) ...  </env>
     <clstack> ListItem(#oldVal(X,OldV:ValueCL)) => .List ... </clstack>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,29)  </ruleCnt>

rule <k> #destruct(location(I:Int,J:Int)) => #free(location(I,J)) ... </k>
     <baddress> address(I)  </baddress>
     <btype> T:CoreTy </btype>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,30)  </ruleCnt>
     requires sortIndex(T) =/=Int 20


rule <k> #destruct(location(I:Int,J:Int)) => . ... </k>
     <baddress> address(I)  </baddress>
     <btype> #raw(T:CoreTy) </btype>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,31)  </ruleCnt>

rule <k> #destruct(valcl(_:Int)) => . ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,32)  </ruleCnt>
     
rule <k> #destruct(valcl(_:Bool)) => . ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,33)  </ruleCnt>

rule <k> #destruct(valcl(_:Float)) => . ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,33)  </ruleCnt>


rule <k> #destruct(#point(_:Ident)) => . ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,34)  </ruleCnt>

rule <k> #destruct(#point(_:ExpCL)) => . ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,35)  </ruleCnt>
     
rule <k> #destruct(#unit) => . ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,36)  </ruleCnt>
     
rule <k> #destruct(cr(Int)) => . ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,37)  </ruleCnt>
     
rule <k> #destruct(uninit(_)) => . ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,38)  </ruleCnt>



rule <k> #tyval(V1:ValueCL,_) +cl V2:ValueCL => V1 +cl V2 ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,39)  </ruleCnt>
     
rule <k> valcl(X:Int) +cl valcl(Y:Int) => valcl(X +Int Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,40)  </ruleCnt>
     
rule <k> L:Location +cl valcl(Y:Int) => *cl na L +cl valcl(Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,41)  </ruleCnt>
     
rule <k> valcl(Y:Int) +cl L:Location => valcl(Y) +cl *cl na L ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,42)  </ruleCnt>
     
rule <k> L1:Location +cl L2:Location => *cl na L1 +cl *cl na L2 ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,43)  </ruleCnt>


//------------------

rule <k> valcl(X:Float) +cl valcl(Y:Float) => valcl(X +Float Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,40)  </ruleCnt>
     
rule <k> L:Location +cl valcl(Y:Float) => *cl na L +cl valcl(Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,41)  </ruleCnt>
     
rule <k> valcl(Y:Float) +cl L:Location => valcl(Y) +cl *cl na L ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,42)  </ruleCnt>
     
//--------------------------

rule <k> valcl(X:Int) &cl valcl(Y:Int) => valcl(X &Int Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,44)  </ruleCnt>
     
rule <k> L:Location &cl valcl(Y:Int) => *cl na L &cl valcl(Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,45)  </ruleCnt>
     
rule <k> valcl(Y:Int) &cl L:Location => valcl(Y) &cl *cl na L ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,46)  </ruleCnt>

rule <k> L1:Location &cl L2:Location => *cl na L1 &cl *cl na L2 ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,47)  </ruleCnt>


rule <k> valcl(X:Int) *-cl valcl(Y:Int) => valcl(X *Int Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,48)  </ruleCnt>
     
rule <k> L:Location *-cl valcl(Y:Int) => *cl na L *-cl valcl(Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,49)  </ruleCnt>
     
rule <k> valcl(Y:Int) *-cl L:Location => valcl(Y) *-cl *cl na L ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,50)  </ruleCnt>
     
rule <k> L1:Location *-cl L2:Location => *cl na L1 *-cl *cl na L2 ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,51)  </ruleCnt>


rule <k> valcl(X:Int) /-cl valcl(Y:Int) => valcl(X /Int Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,52)  </ruleCnt>
     
rule <k> L:Location /-cl valcl(Y:Int) => *cl na L /-cl valcl(Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,53)  </ruleCnt>
     
rule <k> valcl(Y:Int) /-cl L:Location => valcl(Y) /-cl *cl na L ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,54)  </ruleCnt>
     
rule <k> L1:Location /-cl L2:Location => *cl na L1 /-cl *cl na L2 ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,55)  </ruleCnt>


//------------------------------------------------------------------

rule <k> valcl(X:Float) *-cl valcl(Y:Float) => valcl(X *Float Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,48)  </ruleCnt>
     
rule <k> L:Location *-cl valcl(Y:Float) => *cl na L *-cl valcl(Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,49)  </ruleCnt>
     
rule <k> valcl(Y:Float) *-cl L:Location => valcl(Y) *-cl *cl na L ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,50)  </ruleCnt>
     

rule <k> valcl(X:Float) /-cl valcl(Y:Float) => valcl(X /Float Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,52)  </ruleCnt>
     
rule <k> L:Location /-cl valcl(Y:Float) => *cl na L /-cl valcl(Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,53)  </ruleCnt>
     
rule <k> valcl(Y:Float) /-cl L:Location => valcl(Y) /-cl *cl na L ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,54)  </ruleCnt>
     

rule <k> valcl(X:Float) -cl valcl(Y:Float) => valcl(X -Float Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,60)  </ruleCnt>
     
rule <k> L:Location -cl valcl(Y:Float) => *cl na L -cl valcl(Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,61)  </ruleCnt>
     
rule valcl(Y:Float) -cl L:Location => valcl(Y) -cl *cl na L



//------------------------------------------------------------------


rule <k> valcl(X:Int) ^-cl valcl(Y:Int) => valcl(X ^Int Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,56)  </ruleCnt>


rule <k> L:Location ^-cl valcl(Y:Int) => *cl na L ^-cl valcl(Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,57)  </ruleCnt>
     
rule <k> valcl(Y:Int) ^-cl L:Location => valcl(Y) ^-cl *cl na L ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,58)  </ruleCnt>
     
rule <k> L1:Location ^-cl L2:Location => *cl na L1 ^-cl *cl na L2 ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,59)  </ruleCnt>


rule <k> valcl(X:Int) -cl valcl(Y:Int) => valcl(X -Int Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,60)  </ruleCnt>
     
rule <k> L:Location -cl valcl(Y:Int) => *cl na L -cl valcl(Y) ... </k>
     <ruleCnt> RCNT:Map => #updateRuleCnt(RCNT,61)  </ruleCnt>
     
rule valcl(Y:Int) -cl L:Location => valcl(Y) -cl *cl na L
rule L1:Location -cl L2:Location => *cl na L1 -cl *cl na L2


rule valcl(X:Int) <=cl valcl(Y:Int) => boolval(X <=Int Y)
rule L:Location <=cl valcl(Y:Int) => *cl na L <=cl valcl(Y)
rule valcl(Y:Int) <=cl L:Location => valcl(Y) <=cl *cl na L
rule L1:Location <=cl L2:Location => *cl na L1 <=cl *cl na L2


rule valcl(X:Int) <-cl valcl(Y:Int) => boolval(X <Int Y)
rule L:Location <-cl valcl(Y:Int) => *cl na L <-cl valcl(Y)
rule valcl(Y:Int) <-cl L:Location => valcl(Y) <-cl *cl na L
rule L1:Location <-cl L2:Location => *cl na L1 <-cl *cl na L2


rule valcl(X:Int) ==cl valcl(Y:Int) => boolval(X ==Int Y)
rule L:Location ==cl valcl(Y:Int) => *cl na L ==cl valcl(Y)
rule valcl(Y:Int) ==cl L:Location => valcl(Y) ==cl *cl na L
rule L1:Location ==cl L2:Location => *cl na L1 ==cl *cl na L2

rule valcl(X:String) ==cl valcl(Y:String) => boolval(X ==String Y)
rule L:Location ==cl valcl(Y:String) => *cl na L ==cl valcl(Y)
rule valcl(Y:String) ==cl L:Location => valcl(Y) ==cl *cl na L
rule L1:Location ==cl L2:Location => *cl na L1 ==cl *cl na L2


rule valcl(X:Int) >-cl valcl(Y:Int) => boolval(X >Int Y)
rule L:Location >-cl valcl(Y:Int) => *cl na L >-cl valcl(Y)
rule valcl(Y:Int) >-cl L:Location => valcl(Y) >-cl *cl na L
rule L1:Location >-cl L2:Location => *cl na L1 >-cl *cl na L2


rule valcl(X:Int) >=cl valcl(Y:Int) => boolval(X >=Int Y)
rule L:Location >=cl valcl(Y:Int) => *cl na L >=cl valcl(Y)
rule valcl(Y:Int) >=cl L:Location => valcl(Y) >=cl *cl na L
rule L1:Location >=cl L2:Location => *cl na L1 >=cl *cl na L2



rule valcl(X:Int) modcl valcl(Y:Int) => valcl(X modInt Y)
rule L:Location modcl valcl(Y:Int) => *cl na L modcl valcl(Y)
rule valcl(Y:Int) modcl L:Location => valcl(Y) modcl *cl na L
rule L1:Location modcl L2:Location => *cl na L1 modcl *cl na L2

rule valcl(X:Int) &&cl valcl(Y:Int) => boolval(#int2bool(X) andBool #int2bool(Y))
rule L:Location &&cl valcl(Y:Int) => *cl na L &&cl valcl(Y)
rule valcl(Y:Int) &&cl L:Location => valcl(Y) &&cl *cl na L
rule L1:Location &&cl L2:Location => *cl na L1 &&cl *cl na L2

rule valcl(X:Int) ||cl valcl(Y:Int) => boolval(#int2bool(X) orBool #int2bool(Y))
rule L:Location ||cl valcl(Y:Int) => *cl na L ||cl valcl(Y)
rule valcl(Y:Int) ||cl L:Location => valcl(Y) ||cl *cl na L
rule L1:Location ||cl L2:Location => *cl na L1 ||cl *cl na L2

syntax Bool
       ::= #int2bool(Int)			[function]

rule #int2bool(0) => true
rule #int2bool(1) => false


rule boolval(false) => valcl(1)
rule boolval(true)  => valcl(0)

rule #tyExpCL(V:ValueCL,T:CoreTy) => #tyval(V,T)


/*
rule #tmppath(V:ValueCL,T:CoreTy) => #tyval(V,T)
     requires termIndex(V) =/=Int 100010

rule #tyExpCL(V:ValueCL,T:CoreTy) => V
     requires termIndex(V) ==Int 100010

*/

rule <k> X:Ident => V:ValueCL ... </k>
     <env> ... X |-> V ...</env>		    
     requires termIndex(V) =/=Int 10008		[lookup]

rule <k> #cpath(T:CoreTy,F:Ident) => V ...  </k>
     <env> ... #cpath(T,F) |-> V:ValueCL ...  </env>

/*
rule <k> #tpath(X:Ident,_,F:Ident) =>  #cpath(T, F) ... </k>
     <vInfo> ... X |-> varInfo(_,_,T:CoreTy,_,_,_) ...  </vInfo>

rule #tpath(*cl O:Order E:ExpCL,T,F) => #tpath(E,T,F)
*/

syntax ExpCL
       ::= #refcl1(ExpCL, ExpCL)		[strict]
         | #refcl2(ExpCL)			[strict]

//rule refcl(X:Ident) => #point(X)
//rule refcl(V:ValueCL) => #point(V)
rule refcl(E1:ExpCL .cl E2:ExpCL) => #refcl1(E1,E2)
rule refcl(callcl(E1:ExpCL, Es:ExpCLs)) => #refcl2(callcl(E1,Es))
//rule refcl(*cl O:Order E:ExpCL) => #point(*cl O E)

//rule refcl(#cvarcl(E:ExpCL)) => #refcl2(#cvarcl(E))
rule refcl(#cvarcl(E:ExpCL)) => refcl(E)

//rule #refcl2(V:ValueCL) => #point(V)
rule #refcl1(location(A:Int,0), valcl(J:Int)) => #point(location(A,J))

rule refcl(#mapValuecl(E1:ExpCL,E2:ExpCL)) => #refcl2(#mapValuecl(E1,E2))


rule <k> #print(S:String, Vs:ValCLs) => #unit ... </k>
     <output> .List => ListItem(#printStr(S,Vs)) ... </output>

rule #printStr(S:String,#ValCLs(V:ValueCL, Vs:ValCLs))
            => #printStr(replaceFirst(S,"{}", #valtoStr(V)), Vs)
rule #printStr(S:String, .ValCLs) => S

syntax String
       ::= #valtoStr(ValueCL)			[function]
         | #printStr(String,ValCLs)		[function]

rule #valtoStr(valcl(I:Int)) => Int2String(I)
rule #valtoStr(valcl(S:String)) => S


rule location(I:Int,0) .cl valcl(J:Int)  => location(I,J)//*cl na location(I,J)

rule #lenStrcl(valcl(S:String)) => valcl(lengthString(S))

rule #lenStrcl(L:Location) => #lenStrcl(*cl sc L)

rule <k> #lenStrcl(location(A:Int,0)) => #lenStrcl(valcl(S))  ... </k>
     <baddress> address(A)  </baddress>
     <bstore> ... 0 |-> valcl(S:String) ... </bstore>

rule <k> F:Ident => cr(I) ... </k>
     <funclosure>  ... (F |-> I:Int) ...  </funclosure>
     <env> Rho:Map  </env>
     requires notBool #inSet(F,keys(Rho))

syntax ExpCL
       ::= #rawcltmp(ExpCL, ExpCL)		[seqstrict]
         | #rawcltmp1(ExpCL)			[strict]

rule <k> #rawcl(X:Ident) => #rawcl(E) ... </k>
     <env> ... X |-> E:ExpCL ... </env>


rule #rawcl(E1:ExpCL .cl E2:ExpCL) =>  #rawcltmp(E1,E2)
rule #rawcl(#cvarcl(E:ExpCL)) => #rawcl(E)
rule #rawcltmp(location(I:Int,0), valcl(J:Int)) => location(I,J)
rule #rawcl(*cl O:Order E:ExpCL) => #rawcltmp1(*cl O E)

rule #rawcltmp1(L:Location) => L


/*@ the semantics of loop
***************************/

rule #loop C:ExpCL {E:ExpCL} => casecl C of {E ;cl #loopstart(#loop C {E}), #unit}

rule #breakVal ~> #loop C:ExpCL {E:ExpCL} => #breakVal
rule #breakVal ~> #loopstart(#loop C:ExpCL {E:ExpCL}) => #unit

rule #break => #breakVal


rule #loopstart(E:ExpCL) => E

rule #breakVal ~> letcl X:Ident =cl E:ExpCL incl E1:ExpCL => #breakVal
rule #breakVal ~> E1:ExpCL ;cl E2:ExpCL => #breakVal 
rule #breakVal ~> X:Ident => #breakVal
rule #breakVal ~> V:ValueCL => #breakVal
rule #breakVal ~> #cvarcl(E:ExpCL) => #breakVal
rule #breakVal ~> M:MemoryOperations => #breakVal
rule #breakVal ~> *cl O E:ExpCL => #breakVal
rule #breakVal ~> E:ExpCL .cl E1:ExpCL => #breakVal
rule #breakVal ~> refcl(E:ExpCL) => #breakVal
rule #breakVal ~> #refallocate(E:ExpCL) => #breakVal
rule #breakVal ~> callcl(E:ExpCL,Es:ExpCLs) => #breakVal
rule #breakVal ~> pcallcl(E1:ExpCL,E2:ExpCL,Es:ExpCLs) => #breakVal
rule #breakVal ~> A:ArithExpCL => #breakVal
rule #breakVal ~> E:ExpCL :=cl O E1:ExpCL => #breakVal
rule #breakVal ~> E:ExpCL :=cl E1:ExpCL => #breakVal
rule #breakVal ~> F:FnCL => #breakVal
rule #breakVal ~> (| E:ExpCL |) => #breakVal
rule #breakVal ~> assertcl(E:ExpCL) => #breakVal
rule #breakVal ~> clskip => #breakVal
rule #breakVal ~> #move(E:ExpCL) => #breakVal
rule #breakVal ~> #moveVal(E1:ExpCL, E2:ExpCL) => #breakVal
rule #breakVal ~> S:StrExp => #breakVal
rule #breakVal ~> #paniccl(E:ExpCL) => #breakVal
rule #breakVal ~> #rawcl(E:ExpCL) => #breakVal
rule #breakVal ~> #print(S:String,E:ExpCLs) => #breakVal
rule #breakVal ~> #retcl(E1:ExpCL,E2:ExpCL) => #breakVal


rule #breakVal ~> #break => #breakVal






/*@
  The semantics of case
**************************/

syntax CaseItem
       ::= caseItem(Int, ExpCLs)
         | caseItem2(ExpCL, ExpCL, GuardedActions)		[strict(1)]

rule casecl valcl(I:Int) of { EL:ExpCLs}  => caseItem(I, EL)

rule casecl #tyval(valcl(I:Int),_) of {EL:ExpCLs} => caseItem(I, EL)

rule <k> caseItem(I:Int,_:ExpCL,EL:ExpCLs)
     	    => caseItem(I-Int 1, EL) ...  </k> requires I >Int 0 

rule caseItem(0,E:ExpCL,EL:ExpCLs) => E

rule caseItem(0,#ValCLs(E:ValueCL, EL:ValCLs)) => E


rule casecl { G:ExpCL -> E:ExpCL ; GAs:GuardedActions } => caseItem2(G,E,GAs)

rule caseItem2(valcl(0), E, GAs:GuardedActions) => E

rule caseItem2(valcl(1), E, GAs:GuardedActions) => casecl {GAs}

rule caseItem2(valcl(true), E, GAs:GuardedActions) => E

rule caseItem2(valcl(false), E, GAs:GuardedActions) => casecl {GAs}


/*********************Map operations*****************************/

rule <k> #mapAddcl(location(A,0), K:ValueCL,V:ValueCL) => valcl(0) ... </k>
     <baddress> address(A) </baddress>
     <bstore> Rho:Map => K |-> V Rho </bstore>
     <bnum> N:Int => N +Int 1 </bnum>
     requires notBool #inSet(K,keys(Rho))

rule <k> #mapAddcl(location(A,0), K:ValueCL,V:ValueCL) => valcl(1) ... </k>
     <baddress> address(A) </baddress>
     <bstore> ... K |-> (_ => V) ... </bstore>


rule <k> #mapKeyincl(location(A,0), K:ValueCL) => valcl(0) ... </k>
     <baddress> address(A) </baddress>
     <bstore> Rho:Map </bstore>
     requires #inSet(K,keys(Rho))

rule <k> #mapKeyincl(location(A,0), K:ValueCL) => valcl(1) ... </k>
     <baddress> address(A) </baddress>
     <bstore> Rho:Map </bstore>
     requires notBool #inSet(K, keys(Rho))

rule <k> #mapValuecl(location(A,0), K:ValueCL) => V ... </k>
     <baddress> address(A) </baddress>
     <bstore> ... K |-> V ... </bstore>

rule 
      (<thread>
         ...
	 <k> #destructThread </k>
	 <env> .Map </env>
	 <clstack> .List </clstack>
	 ...
	 </thread>
	 ) => .Bag


rule <k> #endThread(I:Int) => #destructThread </k>
     <activeThreads> ... SetItem(I) => .Set ... </activeThreads>

rule <k> #wait(I:Int) => #unit ... </k>
     <activeThreads> SS:Set </activeThreads>
     requires (notBool #inSet(I,SS))


/*@
  The semantics of fork
**************************/

/*
rule <k> #forkcl(valcl(S:String), callcl(E:ExpCL, #ExpCLs(#moveVal(var(C:Int),var(C:Int)), .ExpCLs))) =>  #threadId(N) ... </k>
     <env> ... var(C) |-> (IV:ValueCL => #moveVal(IV,IV)) ...  </env>
     <cntThreads> N:Int => N +Int 1 </cntThreads>
     (.Bag =>
      <thread>
          <threadId> N  </threadId>
	  <tname> S </tname>
	  <k> callcl((fun (.Idents) { letcl var(C) =cl IV incl callcl(E, #ExpCLs(#moveVal(var(C),var(C)), .ExpCLs))})
	      , .ExpCLs) </k>
	  <env> .Map  </env>
	  <clstack> .List </clstack>
      </thread>
     )

*/

rule <k> #forkcl(valcl(S:String), cr(I:Int)) =>  #threadId(N) ... </k>
     <crId>  I  </crId>
     <crContext> Env:Ident  </crContext>
     <env> ... Env |-> (IV:ValueCL => uninit(0)) ...  </env>
     <activeThreads> .Set => SetItem(N) ... </activeThreads>
     <cntThreads> N:Int => N +Int 1 </cntThreads>
     (.Bag =>
      <thread>
          <threadId> N  </threadId>
	  <tname> S </tname>
	  <k> letcl Env =cl IV
	      incl (callcl(cr(I),#ExpCLs(#moveVal(Env,Env), .ExpCLs))) ;cl #endThread(N)  </k>
	  <env> .Map </env>
	  <clstack> .List </clstack>
      </thread>
     )

rule <k> #forkcl(valcl(S:String), cr(I:Int)) =>  #threadId(N) ... </k>
     <crId>  I  </crId>
     <crContext> .K  </crContext>
      <activeThreads> .Set => SetItem(N) ... </activeThreads>
     <cntThreads> N:Int => N +Int 1 </cntThreads>
     (.Bag =>
      <thread>
          <threadId> N  </threadId>
	  <tname> S </tname>
	  <k> callcl(cr(I), .ExpCLs) ;cl #endThread(N) </k>
	  <env> .Map </env>
	  <clstack> .List </clstack>
      </thread>
     )





/*@
  The semantics of assignment
*******************************/

rule <k> #anonymous :=cl _:Order V:ValueCL => #unit ... </k>

rule <k> stackwrite(lhsV(X:Ident), V:ValueCL) => #unit ... </k>
     <env> ... (X |-> (_ => V)) ...  </env>

rule <k> stackwrite(lhsV(X:Ident), V:ValueCL) => #unit ... </k>
     <env> Rho:Map (.Map => X |-> V)  </env>
     requires notBool #inSet(X,keys(Rho))
     	   

rule heapwrite(location(A:Int, I:Int), sc, V:ValueCL)  => writesc(address(A),I,V)
rule heapwrite(location(A:Int, I:Int), na, V:ValueCL)  => writena(address(A),I,V)

rule heapwrite(#point(E:ExpCL), O:Order, V:ValueCL) => heapwrite(lhscl(E),O,V)
rule heapwrite(lhsV(X:Ident), O:Order, V:ValueCL) => stackwrite(lhsV(X),V)




/*@
	The Semantics of Dereference
*/

rule  *cl sc location(A:Int,I:Int) => readsc(address(A),I)
rule  *cl na location(A:Int,I:Int) => readna(address(A),I)
rule  *cl sc #point(X:Ident)	   => X
rule  *cl na #point(X:Ident)	   => X

rule  *cl sc #point(E:ExpCL)	   => E
rule  *cl na #point(E:ExpCL)	   => E


rule clskip => #unit

/*The following rule will be modified to make it more directly*/
//rule letcl X:Ident =cl E1:ExpCL incl E2:ExpCL => lazyCall((fun (X) {E2}), E1)

rule letcl X:Ident =cl V:ValueCL incl E:ExpCL => #letclstmt(X,V,E)



/*********************************/
//rule E1:ExpCL ;cl E2:ExpCL => letcl #anonymous =cl E1 incl E2

rule E1:ExpCL ;cl E2:ExpCL => E1 ~> E2

rule V:ValueCL ~> E2:ExpCL => E2
     requires V =/=K #breakVal

/*********************************/

rule ifcl E:ExpCL thencl E1:ExpCL elsecl E2:ExpCL => casecl E of {E2, E1}

rule .ExpCLs => .ValCLs

rule #ExpCLs(V:ValueCL, VL:ValCLs) => #ValCLs(V, VL)



rule #inSet(E:K, SetItem(E) Rest:Set) => true
rule #inSet(E:K, .Set) => false
rule #inSet(E:K, SetItem(E1) Rest:Set) => #inSet(E,Rest)
     requires E =/=K E1


/*This is for assignment*/




rule lhscl(X:Ident) => lhsV(X)				//location in stack
rule lhscl(*cl O:Order X:ExpCL) => X
rule lhscl(E1:ExpCL .cl E2:ExpCL) => lHS(E1,E2)
rule lhscl(#cvarcl(E:ExpCL)) => lhscl(E)
rule lhscl(allocateInit(_,_)) => valcl(0)
rule lhscl(allocate(_,_)) => valcl(0) 

rule lhscl(callcl(E:ExpCL,Es:ExpCLs)) => valcl(0)
rule lhscl(pcallcl(E1:ExpCL, E:ExpCL,Es:ExpCLs)) => valcl(0)
rule lhscl(valcl(I:Int)) => valcl(I)
rule lhscl(valcl(B:Bool)) => valcl(B)
rule lhscl(valcl(S:String)) => valcl(S)
rule lhscl(refcl(E:ExpCL)) => refcl(E)
rule lhscl(location(A:Int,I:Int)) => location(A,I)

rule lhscl(_:ExpCL +cl _:ExpCL) => valcl(0)
rule lhscl(_:ExpCL -cl _:ExpCL) => valcl(0)
rule lhscl(_:ExpCL &cl _:ExpCL) => valcl(0)
rule lhscl(_:ExpCL ==cl _:ExpCL) => valcl(0)
rule lhscl(_:ExpCL modcl _:ExpCL) => valcl(0)

rule lhscl(_:ExpCL *-cl _:ExpCL) => valcl(0)
rule lhscl(#forkcl(E:ExpCL,E1:ExpCL)) => valcl(0)
rule lhscl(#refallocate(_)) => valcl(0)
rule lhscl(#lenStrcl(_)) => valcl(0)
rule lhscl(#rawcl(_)) => valcl(0)
rule lhscl(#offset(E1:ExpCL, E2:ExpCL)) => valcl(0)
rule lhscl(clskip) => valcl(0)
rule lhscl(#forgetcl(_:ExpCL)) => valcl(0)
rule lhscl(uninit(_:Int)) => valcl(0)

rule lHS(location(I:Int,0),valcl(J:Int)) => location(I,J)





rule E1:ExpCL :=cl O:Order E2:ExpCL => heapwrite(lhscl(E1),O,E2)
rule E1:ExpCL :=cl E2:ExpCL   => stackwrite(lhscl(E1),E2)

rule pcallcl(#tyval(_,T:CoreTy), F:Ident ,Es:ExpCLs) => callcl(#cpath(T,F), Es)

rule assertcl(valcl(0)) => #unit

rule pcallcl(#point(E:ExpCL), F:Ident, Es:ExpCLs) => pcallcl(E,F,Es)

rule <k> pcallcl(location(A:Int,I:Int), F:Ident, Es:ExpCLs) =>  callcl(#cpath(#own(T),F), Es) ...  </k>
     <baddress> address(A) </baddress>
     <btype> T:CoreTy </btype>

/*
rule <k> pcallcl(location(A:Int,I:Int), F:Ident, Es:ExpCLs) =>  callcl(#cpath(#own(T),F), Es) ...  </k>
     <baddress> address(A) </baddress>
     <btype> T:CoreTy </btype>
     */

rule pcallcl(valcl(I:Int), F:Ident, Es:ExpCLs) =>  callcl(#cpath(i32,F), Es)
//rule pcallcl(valcl(), F:Ident, Es:ExpCLs) =>  callcl(#cpath(#getTyId(bool),F), Es)


/******************* Verification **********************/

rule <k> #countMem(I:Int) => #countBlock(Rho) ~> #countMem(I +Int 1) ...  </k>
     <baddress> address(I)  </baddress>
     <bstore> Rho:Map </bstore>

rule <k> #countMem(I:Int) => . ... </k>
     <memaddress> N:Int </memaddress>
     requires I >=Int N



/****************************************************************************/

syntax ExpCL
       ::= #existsReferto(Location, Location)


rule <k> #referto(location(A:Int, I:Int), L:Location) => #existsReferto(location(A,I), L) ... </k>
     <baddress> address(A) </baddress>
     <bstore> ... I |-> L  ... </bstore>

rule <k> #referto(location(A:Int, I:Int), location(A1,I1)) =>
     	 	 #referto(location(A2,I2), location(A1,I1)) ~> #referto(location(A,I+Int 1), location(A1,I1)) ... </k>
     <baddress> address(A) </baddress>
     <bstore> ... I |-> location(A2,I2)  ... </bstore>
     requires (A1 =/=Int A2) orBool (I1 =/=Int I2)

syntax ExpCL
       ::= #refertoM(Location, Map,Location)
         | #isreferTo(Location, Location)


rule #refertoM(LF:Location, (location(A1,I1) |-> V:ValueCL Rho:Map), location(A2,I2)) 
     			    => #referto(location(A1,I1),location(A2,I2)) ~> #refertoM(LF, Rho ,location(A2,I2))
     requires (A1 =/=Int A2) orBool (I1 =/=Int I2)

rule #refertoM(LF:Location, L |-> V Rho:Map, L) => #existsReferto(LF,L)


rule #refertoM(_:Location, .Map, L:Location) => #unit

rule #unit ~> #refertoM(L1:Location, R:Map, L:Location) => #refertoM(L1, R, L)



rule <k> #referto(location(A:Int, 0), L:Location) => #refertoM(location(A,0), (L1 |-> V Rho), L) ...  </k>
     <baddress> address(A) </baddress>
     <bstore> L1:Location |-> V:KItem Rho:Map  </bstore>


rule <k> #referto(location(A:Int,I:Int), L:Location) => #unit ... </k>
     <baddress> address(A) </baddress>
     <bnum> N:Int </bnum>
     requires I >=Int N


rule <k> #referto(location(A:Int,I:Int), L:Location) => #referto(location(A, I +Int 1), L) ... </k>
     <baddress> address(A) </baddress>
     <bstore> ... I |-> T:ValueCL  ... </bstore>
     requires termIndex(T) =/=Int 10007

syntax ExpCL
       ::= #locInMap(K,K,Location,Location)

rule #locInMap(true, true, L1, L) => #existsReferto(L1, L)
rule #locInMap(true, false, L1, L) => #existsReferto(L1, L)
rule #locInMap(false, true, L1, L) => #existsReferto(L1, L)
rule #locInMap(false, false, L1, L) => #unit

/*
rule <k> #referto(location(A:Int,0), L:Location) => #locInMap(#inSet(L,keys(Rho)),  #inSet(L,#list2Set(values(Rho))), location(A,0), L)  ... </k>
     <baddress> address(A) </baddress>
     <bstore> Rho:Map  </bstore>
     <btype> #Map </btype>
*/


rule #referto(L:ValueCL,_) => #unit
     requires termIndex(L) =/=Int 10007

rule #unit ~> #referto(E1:ExpCL, E2:ExpCL) => #referto(E1,E2)

/************** Return Statements  ***************/

syntax RetItem
       ::= #ret(ValueCL)

//syntax KResult
//       ::= RetItem

rule #retcl(V:ValueCL,E:ExpCL) => #move(E) ~> #ret(V)

rule #unit ~> #ret(V:ValueCL) => #ret(V)

rule <k> #ret(V:ValueCL) =>  #ret(V) ... </k> 
     <clstack> ListItem(Rho:Map) => .List ... </clstack>

rule <k> #ret(V:ValueCL) ~> _:K => computeFunBody(V) </k> 
     <clstack> ListItem(#state(RestPGM:K)) ... </clstack>

rule <k> #ret(V:ValueCL) => #destruct(V1) ~> #ret(V) ... </k> 
     <env> ... ((X |-> V1:ValueCL) => .Map) ...  </env>
     <clstack> ListItem(X:Ident) => .List ... </clstack>

rule <k> #ret(V:ValueCL) => #destruct(V1) ~> #ret(V) ... </k> 
     <env> ... (X |-> (V1:ValueCL => OldV)) ...  </env>
     <clstack> ListItem(#oldVal(X,OldV:ValueCL)) => .List ... </clstack>    


endmodule



























