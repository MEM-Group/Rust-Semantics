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
        #Read ( #pair ( #heap ( 1 , 1 ) , valcl ( true ) ) ) ~> #freezer#Move1_ ( #write ( #sl ( 1 ) . valcl ( 1 ) , #uninit ( 0 ) ) ) ~> #freezer#letcl1_ ( var ( 3 ) , clskip ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 1 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #IdTy ( B , #prod ( #fd ( b1 , i32 ) , #fd ( b2 , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) , valcl ( 2 ) , #move ( var ( 0 ) ) , .ExpCLs ) incl letcl var ( 2 ) =cl #move ( var ( 1 ) .cl valcl ( 1 ) ) incl letcl var ( 3 ) =cl #move ( var ( 1 ) .cl valcl ( 1 ) ) incl clskip |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      3
    </slocAddr>
    <sloc>
      0 |-> #uninit ( 0 )
      1 |-> #own ( #blk ( 1 ) )
      2 |-> #own ( #blk ( 0 ) )
    </sloc>
    <blkAddr>
      2
    </blkAddr>
    <blocks>
      #heap ( 0 , 0 ) |-> valcl ( 1 )
      #heap ( 1 , 0 ) |-> valcl ( 2 )
      #heap ( 1 , 1 ) |-> #uninit ( 0 )
      0 |-> #blkInfo ( 1 , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) )
      1 |-> #blkInfo ( 2 , #IdTy ( B , #prod ( #fd ( b1 , i32 ) , #fd ( b2 , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) )
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 0 ) , 2 ) )
      SetItem ( #lread ( #sl ( 1 ) . valcl ( 1 ) , 7 ) )
      SetItem ( #lread ( #sl ( 1 ) . valcl ( 1 ) , 10 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 3 ) )
      SetItem ( #lwrite ( #sl ( 1 ) . valcl ( 1 ) , 8 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 1 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 1 , 1 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
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
        4
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( a , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 1 )
        var ( 1 ) |-> varInfo ( b , #owner ( #IdTy ( B , #prod ( #fd ( b1 , i32 ) , #fd ( b2 , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , 1 )
        var ( 2 ) |-> varInfo ( c , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 1 )
        var ( 3 ) |-> varInfo ( d , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
      A |-> #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) )
      B |-> #IdTy ( B , #prod ( #fd ( b1 , i32 ) , #fd ( b2 , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 1 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #IdTy ( B , #prod ( #fd ( b1 , i32 ) , #fd ( b2 , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) , valcl ( 2 ) , #move ( var ( 0 ) ) , .ExpCLs ) incl letcl var ( 2 ) =cl #move ( var ( 1 ) .cl valcl ( 1 ) ) incl letcl var ( 3 ) =cl #move ( var ( 1 ) .cl valcl ( 1 ) ) incl clskip |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
