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
        #stuck ( #mut ( 4 , 5 , #sl ( 0 ) ) , #shr ( 3 , 7 , #sl ( 0 ) ) ) ~> #ckRefLT ( 3 |-> #shr ( 6 , 6 , #sl ( 0 ) ) , 1 , #mut ( 3 , 7 , #sl ( 0 ) ) ) ~> #ckRefLT ( #heap ( 0 , 0 ) |-> valcl ( 1 )
        #heap ( 0 , 1 ) |-> valcl ( 2 )
        0 |-> #blkInfo ( 2 , #owner ( #array ( i32 , 2 ) ) ) , 1 , #mut ( 3 , 7 , #sl ( 0 ) ) ) ~> #wellFormAct ( #mut ( 3 , 7 , #sl ( 0 ) ) ) ~> #readna ( #sl ( 1 ) ) ~> #freezer#letcl1_ ( var ( 4 ) , clskip ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl refcl ( 1 , var ( 0 ) ) incl letcl var ( 2 ) =cl refcl ( 0 , var ( 0 ) ) incl letcl var ( 3 ) =cl var ( 2 ) incl letcl var ( 4 ) =cl var ( 1 ) incl clskip |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      4
    </slocAddr>
    <sloc>
      0 |-> #own ( #blk ( 0 ) )
      1 |-> #mut ( 3 , 7 , #sl ( 0 ) )
      2 |-> #shr ( 4 , 5 , #sl ( 0 ) )
      3 |-> #shr ( 6 , 6 , #sl ( 0 ) )
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
      SetItem ( #lread ( #sl ( 1 ) , 7 ) )
      SetItem ( #lread ( #sl ( 2 ) , 5 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
      #sl ( 3 ) |-> #ms ( 0 , 0 )
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
        5
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( v , #owner ( #array ( i32 , 2 ) ) , 1 )
        var ( 1 ) |-> varInfo ( b2 , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
        var ( 2 ) |-> varInfo ( b1 , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
        var ( 3 ) |-> varInfo ( z , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
        var ( 4 ) |-> varInfo ( z1 , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl refcl ( 1 , var ( 0 ) ) incl letcl var ( 2 ) =cl refcl ( 0 , var ( 0 ) ) incl letcl var ( 3 ) =cl var ( 2 ) incl letcl var ( 4 ) =cl var ( 1 ) incl clskip |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
