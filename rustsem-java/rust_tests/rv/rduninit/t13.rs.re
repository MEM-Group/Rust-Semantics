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
        #readnap ( #sl ( 0 ) ) ~> #freezer#rdLVfield1_ ( valcl ( true ) , valcl ( 0 ) ) ~> #freezer#Read0_ ( ) ~> #freezer#ExpCLs1_ ( .ExpCLs ) ~> #freezer#print0_ ( "{}" ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
      </k>
      <env>
        var ( 0 ) |-> #sl ( 0 )
        var ( 4 ) |-> #sl ( 1 )
      </env>
      <clstack>
        ListItem ( var ( 4 ) )
        ListItem ( var ( 0 ) |-> #sl ( 0 ) )
        ListItem ( var ( 0 ) )
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
      -1
    </cthread>
  </threads>
  <closures>
    <closureCnt>
      2
    </closureCnt>
    <funclosure>
      funId ( 0 ) |-> 1
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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 4 ) =cl #AllocateInitRaw ( valcl ( 2 ) , #owner ( #closureTy ( #envId ( 0 ) , fnTy ( .CoreTys ) -> i32 ) ) , #AllocateInit ( valcl ( 1 ) , #IdTy ( #env ( 0 ) , #prod ( #fd ( b , #owner ( #array ( i32 , 2 ) ) ) , .Fields ) ) , #move ( var ( 0 ) ) , .ExpCLs ) , fun funId ( 0 ) ( var ( 1 ) , .Idents ) { letcl var ( 2 ) =cl #move ( var ( 1 ) .cl valcl ( 0 ) ) incl letcl var ( 3 ) =cl #move ( var ( 2 ) ) incl valcl ( 1 ) } , .ValueCLs ) incl ( #print ( "{}" , callcl ( var ( 4 ) .cl valcl ( 1 ) , var ( 4 ) .cl valcl ( 0 ) , .ExpCLs ) , .ExpCLs ) ;cl #print ( "{}" , #Index ( var ( 0 ) , valcl ( 0 ) ) , .ExpCLs ) ) |)
      </crBody>
    </closure> <closure>
      <crId>
        1
      </crId>
      <crContext>
        .
      </crContext>
      <crParams>
        var ( 1 ) , .Idents
      </crParams>
      <crBody>
        letcl var ( 2 ) =cl #move ( var ( 1 ) .cl valcl ( 0 ) ) incl letcl var ( 3 ) =cl #move ( var ( 2 ) ) incl valcl ( 1 )
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      5
    </slocAddr>
    <sloc>
      0 |-> #uninit ( 0 )
      1 |-> #Raw ( #heap ( 2 , 0 ) )
    </sloc>
    <blkAddr>
      3
    </blkAddr>
    <blocks>
      #heap ( 2 , 0 ) |-> #own ( #blk ( 1 ) )
      #heap ( 2 , 1 ) |-> cr ( 1 )
      2 |-> #blkInfo ( 2 , #owner ( #closureTy ( #envId ( 0 ) , fnTy ( .CoreTys ) -> i32 ) ) )
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 0 ) , 3 ) )
      SetItem ( #lread ( #sl ( 0 ) , 18 ) )
      SetItem ( #lread ( #sl ( 1 ) . valcl ( 0 ) , 10 ) )
      SetItem ( #lread ( #sl ( 1 ) . valcl ( 1 ) , 9 ) )
      SetItem ( #lread ( #sl ( 2 ) . valcl ( 0 ) , 12 ) )
      SetItem ( #lread ( #sl ( 3 ) , 15 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 4 ) )
      SetItem ( #lwrite ( #sl ( 2 ) . valcl ( 0 ) , 13 ) )
      SetItem ( #lwrite ( #sl ( 3 ) , 16 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #heap ( 1 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 2 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 2 , 1 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 1 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
      #sl ( 3 ) |-> #ms ( 0 , 0 )
      #sl ( 4 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      18
    </clk>
  </memory>
  <output>
    ListItem ( "1" )
  </output>
  <TCContext>
    <varCtx>
      <varCnt>
        5
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( b , #owner ( #array ( i32 , 2 ) ) , 1 )
        var ( 1 ) |-> varInfo ( #envId ( 0 ) , #owner ( #IdTy ( #env ( 0 ) , #prod ( #fd ( b , #owner ( #array ( i32 , 2 ) ) ) , .Fields ) ) ) , 2 )
        var ( 2 ) |-> varInfo ( b , #owner ( #array ( i32 , 2 ) ) , 2 )
        var ( 3 ) |-> varInfo ( x , #owner ( #array ( i32 , 2 ) ) , 2 )
        var ( 4 ) |-> varInfo ( c , #owner ( #closureTy ( #envId ( 0 ) , fnTy ( .CoreTys ) -> i32 ) ) , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
      #env ( 0 ) |-> #IdTy ( #env ( 0 ) , #prod ( #fd ( b , #owner ( #array ( i32 , 2 ) ) ) , .Fields ) )
      funId ( 0 ) |-> #closureTy ( #envId ( 0 ) , fnTy ( .CoreTys ) -> i32 )
      main |-> fnTy ( .CoreTys ) -> #void
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 4 ) =cl #AllocateInitRaw ( valcl ( 2 ) , #owner ( #closureTy ( #envId ( 0 ) , fnTy ( .CoreTys ) -> i32 ) ) , #AllocateInit ( valcl ( 1 ) , #IdTy ( #env ( 0 ) , #prod ( #fd ( b , #owner ( #array ( i32 , 2 ) ) ) , .Fields ) ) , #move ( var ( 0 ) ) , .ExpCLs ) , fun funId ( 0 ) ( var ( 1 ) , .Idents ) { letcl var ( 2 ) =cl #move ( var ( 1 ) .cl valcl ( 0 ) ) incl letcl var ( 3 ) =cl #move ( var ( 2 ) ) incl valcl ( 1 ) } , .ValueCLs ) incl ( #print ( "{}" , callcl ( var ( 4 ) .cl valcl ( 1 ) , var ( 4 ) .cl valcl ( 0 ) , .ExpCLs ) , .ExpCLs ) ;cl #print ( "{}" , #Index ( var ( 0 ) , valcl ( 0 ) ) , .ExpCLs ) ) |) } )
      </tstack>
      <closureId>
        1
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
