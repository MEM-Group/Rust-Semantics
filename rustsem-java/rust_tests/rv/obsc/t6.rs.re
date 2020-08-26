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
        #stuck ( #lwrite ( #sl ( 0 ) , 5 ) , #shr ( 3 , 7 , #sl ( 0 ) ) ) ~> #readna ( #sl ( 1 ) ) ~> clskip ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
      </k>
      <env>
        var ( 0 ) |-> #sl ( 0 )
        var ( 1 ) |-> #sl ( 1 )
        var ( 2 ) |-> #sl ( 2 )
      </env>
      <clstack>
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
      0
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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl refcl ( 0 , var ( 0 ) ) incl letcl var ( 2 ) =cl #move ( var ( 0 ) ) incl ( var ( 1 ) ;cl clskip ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      3
    </slocAddr>
    <sloc>
      0 |-> #uninit ( 0 )
      1 |-> #shr ( 3 , 7 , #sl ( 0 ) )
      2 |-> #own ( #blk ( 0 ) )
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
      SetItem ( #lread ( #sl ( 0 ) , 4 ) )
      SetItem ( #lread ( #sl ( 1 ) , 7 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 5 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      8
    </clk>
  </memory>
  <output>
    .List
  </output>
  <TCContext>
    <varCtx>
      <varCnt>
        3
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( x , #owner ( #array ( i32 , 2 ) ) , 1 )
        var ( 1 ) |-> varInfo ( b , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
        var ( 2 ) |-> varInfo ( t , #owner ( #array ( i32 , 2 ) ) , 1 )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl refcl ( 0 , var ( 0 ) ) incl letcl var ( 2 ) =cl #move ( var ( 0 ) ) incl ( var ( 1 ) ;cl clskip ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
