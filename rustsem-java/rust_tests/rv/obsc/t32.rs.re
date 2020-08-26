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
        #stuck ( #mut ( 8 , 8 , #sl ( 1 ) . valcl ( 0 ) . valcl ( 0 ) ) , #shr ( 7 , 9 , #sl ( 1 ) . valcl ( 0 ) ) ) ~> #ckRefLT ( .Map , 2 , #shr ( 7 , 9 , #sl ( 1 ) . valcl ( 0 ) ) ) ~> #ckRefLT ( #heap ( 0 , 0 ) |-> valcl ( 2 )
        #heap ( 1 , 0 ) |-> #own ( #blk ( 0 ) )
        #heap ( 1 , 1 ) |-> valcl ( 32 )
        0 |-> #blkInfo ( 1 , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) )
        1 |-> #blkInfo ( 2 , #IdTy ( B , #prod ( #fd ( fa , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , #fd ( fb , i32 ) , .Fields ) ) ) , 2 , #shr ( 7 , 9 , #sl ( 1 ) . valcl ( 0 ) ) ) ~> #wellFormAct ( #shr ( 7 , 9 , #sl ( 1 ) . valcl ( 0 ) ) ) ~> #readna ( #sl ( 2 ) ) ~> #freezer#letcl1_ ( var ( 4 ) , clskip ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #IdTy ( B , #prod ( #fd ( fa , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , #fd ( fb , i32 ) , .Fields ) ) , #move ( var ( 0 ) ) , valcl ( 32 ) , .ExpCLs ) incl letcl var ( 2 ) =cl refcl ( 0 , var ( 1 ) .cl valcl ( 0 ) ) incl letcl var ( 3 ) =cl refcl ( 1 , ( var ( 1 ) .cl valcl ( 0 ) ) .cl valcl ( 0 ) ) incl letcl var ( 4 ) =cl var ( 2 ) incl clskip |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      4
    </slocAddr>
    <sloc>
      0 |-> #uninit ( 0 )
      1 |-> #own ( #blk ( 1 ) )
      2 |-> #shr ( 7 , 9 , #sl ( 1 ) . valcl ( 0 ) )
      3 |-> #mut ( 8 , 8 , #sl ( 1 ) . valcl ( 0 ) . valcl ( 0 ) )
    </sloc>
    <blkAddr>
      2
    </blkAddr>
    <blocks>
      #heap ( 0 , 0 ) |-> valcl ( 2 )
      #heap ( 1 , 0 ) |-> #own ( #blk ( 0 ) )
      #heap ( 1 , 1 ) |-> valcl ( 32 )
      0 |-> #blkInfo ( 1 , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) )
      1 |-> #blkInfo ( 2 , #IdTy ( B , #prod ( #fd ( fa , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , #fd ( fb , i32 ) , .Fields ) ) )
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 0 ) , 2 ) )
      SetItem ( #lread ( #sl ( 2 ) , 9 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 3 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 1 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 1 , 1 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
      #sl ( 3 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      10
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
        var ( 0 ) |-> varInfo ( a , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 1 )
        var ( 1 ) |-> varInfo ( b , #owner ( #IdTy ( B , #prod ( #fd ( fa , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , #fd ( fb , i32 ) , .Fields ) ) ) , 1 )
        var ( 2 ) |-> varInfo ( c , #ref ( #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , 1 )
        var ( 3 ) |-> varInfo ( t , #ref ( i32 ) , 1 )
        var ( 4 ) |-> varInfo ( z , #ref ( #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
      A |-> #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) )
      B |-> #IdTy ( B , #prod ( #fd ( fa , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , #fd ( fb , i32 ) , .Fields ) )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #IdTy ( B , #prod ( #fd ( fa , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , #fd ( fb , i32 ) , .Fields ) ) , #move ( var ( 0 ) ) , valcl ( 32 ) , .ExpCLs ) incl letcl var ( 2 ) =cl refcl ( 0 , var ( 1 ) .cl valcl ( 0 ) ) incl letcl var ( 3 ) =cl refcl ( 1 , ( var ( 1 ) .cl valcl ( 0 ) ) .cl valcl ( 0 ) ) incl letcl var ( 4 ) =cl var ( 2 ) incl clskip |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
