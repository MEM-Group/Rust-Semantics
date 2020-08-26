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
        #readnap ( #sl ( 0 ) ) ~> #freezer#rdLVfield1_ ( valcl ( true ) , valcl ( 0 ) ) ~> #freezer#Read0_ ( ) ~> #freezer#ExpCLs1_ ( .ExpCLs ) ~> #freezer#print0_ ( "{}" ) ~> #print ( "{}" , #Index ( var ( 1 ) , valcl ( 0 ) ) , .ExpCLs ) ;cl #print ( "{}" , #Index ( var ( 2 ) , valcl ( 0 ) ) , .ExpCLs ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
      </k>
      <env>
        var ( 0 ) |-> #sl ( 0 )
        var ( 1 ) |-> #sl ( 1 )
        var ( 2 ) |-> #sl ( 2 )
        var ( 3 ) |-> #sl ( 3 )
      </env>
      <clstack>
        ListItem ( var ( 3 ) )
        ListItem ( var ( 0 ) |-> #sl ( 0 )
        var ( 1 ) |-> #sl ( 1 )
        var ( 2 ) |-> #sl ( 2 ) )
        ListItem ( var ( 2 ) )
        ListItem ( var ( 0 ) |-> #sl ( 0 )
        var ( 1 ) |-> #sl ( 1 ) )
        ListItem ( var ( 1 ) )
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
      1
    </closureCnt>
    <funclosure>
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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #move ( var ( 0 ) ) incl letcl var ( 2 ) =cl #move ( var ( 1 ) ) incl letcl var ( 3 ) =cl #move ( var ( 2 ) ) incl ( #print ( "{}" , #Index ( var ( 0 ) , valcl ( 0 ) ) , .ExpCLs ) ;cl #print ( "{}" , #Index ( var ( 1 ) , valcl ( 0 ) ) , .ExpCLs ) ;cl #print ( "{}" , #Index ( var ( 2 ) , valcl ( 0 ) ) , .ExpCLs ) ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      4
    </slocAddr>
    <sloc>
      0 |-> #uninit ( 0 )
      1 |-> #uninit ( 0 )
      2 |-> #uninit ( 0 )
      3 |-> #own ( #blk ( 0 ) )
    </sloc>
    <blkAddr>
      1
    </blkAddr>
    <blocks>
      #heap ( 0 , 0 ) |-> valcl ( 1 )
      #heap ( 0 , 1 ) |-> valcl ( 2 )
      0 |-> #blkInfo ( 2 , #owner ( #array ( i32 , 2 ) ) )
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 0 ) , 3 ) )
      SetItem ( #lread ( #sl ( 0 ) , 12 ) )
      SetItem ( #lread ( #sl ( 1 ) , 6 ) )
      SetItem ( #lread ( #sl ( 2 ) , 9 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 4 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 7 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 10 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 1 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
      #sl ( 3 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      12
    </clk>
  </memory>
  <output>
    .List
  </output>
  <TCContext>
    <varCtx>
      <varCnt>
        4
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( v , #owner ( #array ( i32 , 2 ) ) , 1 )
        var ( 1 ) |-> varInfo ( v1 , #owner ( #array ( i32 , 2 ) ) , 1 )
        var ( 2 ) |-> varInfo ( v2 , #owner ( #array ( i32 , 2 ) ) , 1 )
        var ( 3 ) |-> varInfo ( v3 , #owner ( #array ( i32 , 2 ) ) , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #move ( var ( 0 ) ) incl letcl var ( 2 ) =cl #move ( var ( 1 ) ) incl letcl var ( 3 ) =cl #move ( var ( 2 ) ) incl ( #print ( "{}" , #Index ( var ( 0 ) , valcl ( 0 ) ) , .ExpCLs ) ;cl #print ( "{}" , #Index ( var ( 1 ) , valcl ( 0 ) ) , .ExpCLs ) ;cl #print ( "{}" , #Index ( var ( 2 ) , valcl ( 0 ) ) , .ExpCLs ) ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
