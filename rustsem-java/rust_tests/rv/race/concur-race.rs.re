<generatedTop>
  <threads>
    <Thread>
      <threadId>
        0
      </threadId>
      <tname>
        "main"
      </tname>
      <k>
        #readna ( #sl ( 4 ) ) ~> #freezer#rdLVfield1_ ( valcl ( false ) , valcl ( 0 ) ) ~> #freezer#Read0_ ( ) ~> #freezer#forkcl1_ ( refcl ( 1 , var ( 2 ) ) ) ~> #freezer#ExpCLs1_ ( .ExpCLs ) ~> #freezer#AllocateInit0_ ( valcl ( 1 ) , #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) ) ~> #freezer#computeFB0_ ( )
      </k>
      <env>
        var ( 1 ) |-> #sl ( 6 )
        var ( 2 ) |-> #sl ( 7 )
        var ( 3 ) |-> #sl ( 3 )
        var ( 4 ) |-> #sl ( 5 )
        var ( 5 ) |-> #sl ( 0 )
        var ( 6 ) |-> #sl ( 1 )
        var ( 9 ) |-> #sl ( 2 )
      </env>
      <clstack>
        ListItem ( var ( 2 ) )
        ListItem ( var ( 1 ) )
        ListItem ( #state ( #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) , var ( 3 ) |-> #sl ( 3 )
        var ( 4 ) |-> #sl ( 5 )
        var ( 5 ) |-> #sl ( 0 )
        var ( 6 ) |-> #sl ( 1 )
        var ( 9 ) |-> #sl ( 2 ) ) )
        ListItem ( var ( 4 ) )
        ListItem ( var ( 3 ) |-> #sl ( 3 )
        var ( 5 ) |-> #sl ( 0 )
        var ( 6 ) |-> #sl ( 1 )
        var ( 9 ) |-> #sl ( 2 ) )
        ListItem ( var ( 3 ) )
        ListItem ( #state ( #freezer#letcl1_ ( var ( 10 ) , letcl var ( 11 ) =cl var ( 5 ) .cl valcl ( 0 ) incl ( callcl ( #cpath ( #owner ( #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) ) , join ) , refcl ( 0 , var ( 10 ) ) , .ExpCLs ) ;cl clskip ) ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) , var ( 5 ) |-> #sl ( 0 )
        var ( 6 ) |-> #sl ( 1 )
        var ( 9 ) |-> #sl ( 2 ) ) )
        ListItem ( var ( 9 ) )
        ListItem ( var ( 5 ) |-> #sl ( 0 )
        var ( 6 ) |-> #sl ( 1 ) )
        ListItem ( var ( 6 ) )
        ListItem ( var ( 5 ) |-> #sl ( 0 ) )
        ListItem ( var ( 5 ) )
        ListItem ( .Map )
        ListItem ( #state ( . , .Map ) )
      </clstack>
    </Thread>
    <activeThreads>
      SetItem ( 0 )
    </activeThreads>
    <cntThreads>
      1
    </cntThreads>
    <cthread>
      0
    </cthread>
  </threads>
  <closures>
    <closureCnt>
      6
    </closureCnt>
    <funclosure>
      #cpath ( #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , new ) |-> 3
      #cpath ( #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , spawn ) |-> 2
      #cpath ( #owner ( #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) ) , join ) |-> 4
      #cpath ( #owner ( #IdTy ( thread , #prod ( .Fields ) ) ) , spawn ) |-> 1
      funId ( 0 ) |-> 5
      main |-> 0
    </funclosure>
    <closure>
      <crId>
        0
      </crId>
      <crContext>
        .
      </crContext>
      <crParams>
        .Idents
      </crParams>
      <crBody>
        (| letcl var ( 5 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) , valcl ( 1 ) , .ExpCLs ) incl letcl var ( 6 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( ARC , #prod ( #fd ( p , #raw ( #owner ( #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) ) ) ) , .Fields ) ) , #RawCL ( refcl ( 1 , var ( 5 ) ) ) , .ExpCLs ) incl letcl var ( 9 ) =cl #AllocateInitRaw ( valcl ( 2 ) , #owner ( #closureTy ( #envId ( 0 ) , fnTy ( .CoreTys ) -> #void ) ) , #AllocateInit ( valcl ( 1 ) , #IdTy ( #env ( 0 ) , #prod ( #fd ( r , #owner ( #IdTy ( ARC , #prod ( #fd ( p , #raw ( #owner ( #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) ) ) ) , .Fields ) ) ) ) , .Fields ) ) , #move ( var ( 6 ) ) , .ExpCLs ) , fun funId ( 0 ) ( var ( 7 ) , .Idents ) { letcl var ( 8 ) =cl #move ( var ( 7 ) .cl valcl ( 0 ) ) incl ( *cl na ( var ( 8 ) .cl valcl ( 0 ) ) .cl valcl ( 0 ) :=cl sc valcl ( 4 ) ;cl clskip ;cl clskip ) } , .ValueCLs ) incl letcl var ( 10 ) =cl callcl ( #cpath ( #owner ( #IdTy ( thread , #prod ( .Fields ) ) ) , spawn ) , #move ( var ( 9 ) ) , .ExpCLs ) incl letcl var ( 11 ) =cl var ( 5 ) .cl valcl ( 0 ) incl ( callcl ( #cpath ( #owner ( #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) ) , join ) , refcl ( 0 , var ( 10 ) ) , .ExpCLs ) ;cl clskip ) |)
      </crBody>
    </closure> <closure>
      <crId>
        1
      </crId>
      <crContext>
        .
      </crContext>
      <crParams>
        var ( 3 ) , .Idents
      </crParams>
      <crBody>
        (| letcl var ( 4 ) =cl callcl ( #cpath ( #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , new ) , .ExpCLs ) incl callcl ( #cpath ( #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , spawn ) , #move ( var ( 4 ) ) , #move ( var ( 3 ) ) , .ExpCLs ) |)
      </crBody>
    </closure> <closure>
      <crId>
        2
      </crId>
      <crContext>
        .
      </crContext>
      <crParams>
        var ( 1 ) , var ( 2 ) , .Idents
      </crParams>
      <crBody>
        (| #AllocateInit ( valcl ( 1 ) , #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) , #forkcl ( *cl na ( var ( 1 ) .cl valcl ( 0 ) ) .cl valcl ( 0 ) , refcl ( 1 , var ( 2 ) ) ) , .ExpCLs ) |)
      </crBody>
    </closure> <closure>
      <crId>
        3
      </crId>
      <crContext>
        .
      </crContext>
      <crParams>
        .Idents
      </crParams>
      <crBody>
        (| #AllocateInit ( valcl ( 1 ) , #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) , #refallocate ( #allocateInit ( valcl ( 1 ) , #owner ( str ) , valcl ( "" ) , .ValueCLs ) ) , .ExpCLs ) |)
      </crBody>
    </closure> <closure>
      <crId>
        4
      </crId>
      <crContext>
        .
      </crContext>
      <crParams>
        var ( 0 ) , .Idents
      </crParams>
      <crBody>
        (| #wait ( *cl na var ( 0 ) .cl valcl ( 0 ) ) |)
      </crBody>
    </closure> <closure>
      <crId>
        5
      </crId>
      <crContext>
        .
      </crContext>
      <crParams>
        var ( 7 ) , .Idents
      </crParams>
      <crBody>
        letcl var ( 8 ) =cl #move ( var ( 7 ) .cl valcl ( 0 ) ) incl ( *cl na ( var ( 8 ) .cl valcl ( 0 ) ) .cl valcl ( 0 ) :=cl sc valcl ( 4 ) ;cl clskip ;cl clskip )
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      8
    </slocAddr>
    <sloc>
      0 |-> #own ( #blk ( 0 ) )
      1 |-> #uninit ( 0 )
      2 |-> #Raw ( #heap ( 3 , 0 ) )
      3 |-> #Raw ( #heap ( 3 , 0 ) )
      4 |-> #own ( #blk ( 4 ) )
      5 |-> #uninit ( 0 )
      6 |-> #own ( #blk ( 5 ) )
      7 |-> #Raw ( #heap ( 3 , 0 ) )
    </sloc>
    <blkAddr>
      6
    </blkAddr>
    <blocks>
      #heap ( 0 , 0 ) |-> valcl ( 1 )
      #heap ( 1 , 0 ) |-> #Raw ( #sl ( 0 ) )
      #heap ( 2 , 0 ) |-> #own ( #blk ( 1 ) )
      #heap ( 3 , 0 ) |-> #own ( #blk ( 2 ) )
      #heap ( 3 , 1 ) |-> cr ( 5 )
      #heap ( 4 , 0 ) |-> valcl ( "" )
      #heap ( 5 , 0 ) |-> #shr ( 13 , 20 , #sl ( 4 ) )
      0 |-> #blkInfo ( 1 , #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) )
      1 |-> #blkInfo ( 1 , #IdTy ( ARC , #prod ( #fd ( p , #raw ( #owner ( #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) ) ) ) , .Fields ) ) )
      2 |-> #blkInfo ( 1 , #IdTy ( #env ( 0 ) , #prod ( #fd ( r , #owner ( #IdTy ( ARC , #prod ( #fd ( p , #raw ( #owner ( #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) ) ) ) , .Fields ) ) ) ) , .Fields ) ) )
      3 |-> #blkInfo ( 2 , #owner ( #closureTy ( #envId ( 0 ) , fnTy ( .CoreTys ) -> #void ) ) )
      4 |-> #blkInfo ( 1 , #owner ( str ) )
      5 |-> #blkInfo ( 1 , #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) )
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 1 ) , 4 ) )
      SetItem ( #lread ( #sl ( 2 ) , 10 ) )
      SetItem ( #lread ( #sl ( 3 ) , 17 ) )
      SetItem ( #lread ( #sl ( 5 ) , 15 ) )
      SetItem ( #lread ( #sl ( 6 ) . valcl ( 0 ) , 20 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 5 ) )
      SetItem ( #lwrite ( #sl ( 5 ) , 16 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 1 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 2 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 3 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 3 , 1 ) |-> #ms ( 0 , 0 )
      #heap ( 4 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 5 , 0 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
      #sl ( 3 ) |-> #ms ( 0 , 0 )
      #sl ( 5 ) |-> #ms ( 0 , 0 )
      #sl ( 6 ) |-> #ms ( 0 , 0 )
      #sl ( 7 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      20
    </clk>
  </memory>
  <output>
    .List
  </output>
  <TCContext>
    <varCtx>
      <varCnt>
        12
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( #selfX , #ref ( #owner ( #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) ) ) , 1 )
        var ( 1 ) |-> varInfo ( #selfX , #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , 1 )
        var ( 2 ) |-> varInfo ( f , #ty ( F ) , 1 )
        var ( 3 ) |-> varInfo ( f , #ty ( T ) , 1 )
        var ( 4 ) |-> varInfo ( builder , #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , 1 )
        var ( 5 ) |-> varInfo ( v , #owner ( #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) ) , 1 )
        var ( 6 ) |-> varInfo ( r , #owner ( #IdTy ( ARC , #prod ( #fd ( p , #raw ( #owner ( #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) ) ) ) , .Fields ) ) ) , 1 )
        var ( 7 ) |-> varInfo ( #envId ( 0 ) , #owner ( #IdTy ( #env ( 0 ) , #prod ( #fd ( r , #owner ( #IdTy ( ARC , #prod ( #fd ( p , #raw ( #owner ( #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) ) ) ) , .Fields ) ) ) ) , .Fields ) ) ) , 2 )
        var ( 8 ) |-> varInfo ( r , #owner ( #IdTy ( ARC , #prod ( #fd ( p , #raw ( #owner ( #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) ) ) ) , .Fields ) ) ) , 2 )
        var ( 9 ) |-> varInfo ( t , #owner ( #closureTy ( #envId ( 0 ) , fnTy ( .CoreTys ) -> #void ) ) , 1 )
        var ( 10 ) |-> varInfo ( handle , #owner ( #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) ) , 1 )
        var ( 11 ) |-> varInfo ( z , i32 , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
      #cpath ( #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , new ) |-> fnTy ( .CoreTys ) -> #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) )
      #cpath ( #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , spawn ) |-> fnTy ( #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , #ty ( F ) , .CoreTys ) -> #owner ( #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) )
      #cpath ( #owner ( #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) ) , join ) |-> fnTy ( #ref ( #owner ( #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) ) ) , .CoreTys ) -> #void
      #cpath ( #owner ( #IdTy ( thread , #prod ( .Fields ) ) ) , spawn ) |-> fnTy ( #ty ( T ) , .CoreTys ) -> #owner ( #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) )
      #env ( 0 ) |-> #IdTy ( #env ( 0 ) , #prod ( #fd ( r , #owner ( #IdTy ( ARC , #prod ( #fd ( p , #raw ( #owner ( #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) ) ) ) , .Fields ) ) ) ) , .Fields ) )
      ARC |-> #IdTy ( ARC , #prod ( #fd ( p , #raw ( #owner ( #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) ) ) ) , .Fields ) )
      Builder |-> #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) )
      JoinHandle |-> #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) )
      P |-> #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) )
      funId ( 0 ) |-> #closureTy ( #envId ( 0 ) , fnTy ( .CoreTys ) -> #void )
      main |-> fnTy ( .CoreTys ) -> #void
      thread |-> #IdTy ( thread , #prod ( .Fields ) )
    </typeCtx>
    <cpable>
      SetItem ( bool )
      SetItem ( i32 )
    </cpable>
    <tcenv>
      .Map
    </tcenv>
    <stackEnv>
      .List
    </stackEnv>
    <lifetime>
      <currentLft>
        0
      </currentLft>
    </lifetime>
    <desugar>
      <tstack>
        ListItem ( ( ( ( fun main ( .Idents ) { (| letcl var ( 5 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) , valcl ( 1 ) , .ExpCLs ) incl letcl var ( 6 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( ARC , #prod ( #fd ( p , #raw ( #owner ( #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) ) ) ) , .Fields ) ) , #RawCL ( refcl ( 1 , var ( 5 ) ) ) , .ExpCLs ) incl letcl var ( 9 ) =cl #AllocateInitRaw ( valcl ( 2 ) , #owner ( #closureTy ( #envId ( 0 ) , fnTy ( .CoreTys ) -> #void ) ) , #AllocateInit ( valcl ( 1 ) , #IdTy ( #env ( 0 ) , #prod ( #fd ( r , #owner ( #IdTy ( ARC , #prod ( #fd ( p , #raw ( #owner ( #IdTy ( P , #prod ( #fd ( x , i32 ) , .Fields ) ) ) ) ) , .Fields ) ) ) ) , .Fields ) ) , #move ( var ( 6 ) ) , .ExpCLs ) , fun funId ( 0 ) ( var ( 7 ) , .Idents ) { letcl var ( 8 ) =cl #move ( var ( 7 ) .cl valcl ( 0 ) ) incl ( *cl na ( var ( 8 ) .cl valcl ( 0 ) ) .cl valcl ( 0 ) :=cl sc valcl ( 4 ) ;cl clskip ;cl clskip ) } , .ValueCLs ) incl letcl var ( 10 ) =cl callcl ( #cpath ( #owner ( #IdTy ( thread , #prod ( .Fields ) ) ) , spawn ) , #move ( var ( 9 ) ) , .ExpCLs ) incl letcl var ( 11 ) =cl var ( 5 ) .cl valcl ( 0 ) incl ( callcl ( #cpath ( #owner ( #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) ) , join ) , refcl ( 0 , var ( 10 ) ) , .ExpCLs ) ;cl clskip ) |) } ;cl fun #cpath ( #owner ( #IdTy ( thread , #prod ( .Fields ) ) ) , spawn ) ( var ( 3 ) , .Idents ) { (| letcl var ( 4 ) =cl callcl ( #cpath ( #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , new ) , .ExpCLs ) incl callcl ( #cpath ( #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , spawn ) , #move ( var ( 4 ) ) , #move ( var ( 3 ) ) , .ExpCLs ) |) } ) ;cl fun #cpath ( #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , spawn ) ( var ( 1 ) , var ( 2 ) , .Idents ) { (| #AllocateInit ( valcl ( 1 ) , #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) , #forkcl ( *cl na ( var ( 1 ) .cl valcl ( 0 ) ) .cl valcl ( 0 ) , refcl ( 1 , var ( 2 ) ) ) , .ExpCLs ) |) } ) ;cl fun #cpath ( #owner ( #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) ) , new ) ( .Idents ) { (| #AllocateInit ( valcl ( 1 ) , #IdTy ( Builder , #prod ( #fd ( name , #ref ( #owner ( str ) ) ) , .Fields ) ) , #refallocate ( #allocateInit ( valcl ( 1 ) , #owner ( str ) , valcl ( "" ) , .ValueCLs ) ) , .ExpCLs ) |) } ) ;cl fun #cpath ( #owner ( #IdTy ( JoinHandle , #prod ( #fd ( handle , i32 ) , .Fields ) ) ) , join ) ( var ( 0 ) , .Idents ) { (| #wait ( *cl na var ( 0 ) .cl valcl ( 0 ) ) |) } )
      </tstack>
      <closureId>
        1
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
