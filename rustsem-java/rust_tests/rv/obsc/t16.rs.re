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
        #stuck ( #mut ( 2 , 2 , #sl ( 0 ) ) , #mut ( 1 , 3 , #sl ( 0 ) ) ) ~> #ckRefLT ( .Map , 1 , #mut ( 1 , 3 , #sl ( 0 ) ) ) ~> #ckRefLT ( .Map , 1 , #mut ( 1 , 3 , #sl ( 0 ) ) ) ~> #wellFormAct ( #mut ( 1 , 3 , #sl ( 0 ) ) ) ~> #readna ( #sl ( 1 ) ) ~> #freezer#letcl1_ ( var ( 3 ) , clskip ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
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
        (| letcl var ( 0 ) =cl valcl ( 1 ) incl letcl var ( 1 ) =cl refcl ( 1 , var ( 0 ) ) incl letcl var ( 2 ) =cl refcl ( 1 , var ( 0 ) ) incl letcl var ( 3 ) =cl var ( 1 ) incl clskip |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      3
    </slocAddr>
    <sloc>
      0 |-> valcl ( 1 )
      1 |-> #mut ( 1 , 3 , #sl ( 0 ) )
      2 |-> #mut ( 2 , 2 , #sl ( 0 ) )
    </sloc>
    <blkAddr>
      0
    </blkAddr>
    <blocks>
      .Map
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 1 ) , 3 ) )
    </locRW>
    <memStatus>
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      4
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
        var ( 0 ) |-> varInfo ( v , i32 , 1 )
        var ( 1 ) |-> varInfo ( b1 , #ref ( i32 ) , 1 )
        var ( 2 ) |-> varInfo ( b2 , #ref ( i32 ) , 1 )
        var ( 3 ) |-> varInfo ( z , #ref ( i32 ) , 1 )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl valcl ( 1 ) incl letcl var ( 1 ) =cl refcl ( 1 , var ( 0 ) ) incl letcl var ( 2 ) =cl refcl ( 1 , var ( 0 ) ) incl letcl var ( 3 ) =cl var ( 1 ) incl clskip |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
