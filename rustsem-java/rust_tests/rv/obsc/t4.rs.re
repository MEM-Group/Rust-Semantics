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
        #readna ( #sl ( 0 ) ) ~> #freezer#rdLVfield1_ ( valcl ( false ) , valcl ( 0 ) ) ~> #freezer#Read0_ ( ) ~> #freezer#letcl1_ ( var ( 1 ) , letcl var ( 2 ) =cl *cl na var ( 0 ) .cl valcl ( 0 ) incl clskip ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
      </k>
      <env>
        var ( 0 ) |-> #sl ( 1 )
      </env>
      <clstack>
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
        (| letcl var ( 0 ) =cl #refallocate ( #allocateInit ( valcl ( 1 ) , #owner ( str ) , valcl ( "ss" ) , .ValueCLs ) ) incl letcl var ( 1 ) =cl *cl na var ( 0 ) .cl valcl ( 0 ) incl letcl var ( 2 ) =cl *cl na var ( 0 ) .cl valcl ( 0 ) incl clskip |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      2
    </slocAddr>
    <sloc>
      0 |-> #own ( #blk ( 0 ) )
      1 |-> #shr ( 1 , 2 , #sl ( 0 ) )
    </sloc>
    <blkAddr>
      1
    </blkAddr>
    <blocks>
      #heap ( 0 , 0 ) |-> valcl ( "ss" )
      0 |-> #blkInfo ( 1 , #owner ( str ) )
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 1 ) , 2 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      2
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
        var ( 0 ) |-> varInfo ( x , #ref ( #owner ( str ) ) , 1 )
        var ( 1 ) |-> varInfo ( y , #ref ( #owner ( str ) ) , 1 )
        var ( 2 ) |-> varInfo ( z , #ref ( #owner ( str ) ) , 1 )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #refallocate ( #allocateInit ( valcl ( 1 ) , #owner ( str ) , valcl ( "ss" ) , .ValueCLs ) ) incl letcl var ( 1 ) =cl *cl na var ( 0 ) .cl valcl ( 0 ) incl letcl var ( 2 ) =cl *cl na var ( 0 ) .cl valcl ( 0 ) incl clskip |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
