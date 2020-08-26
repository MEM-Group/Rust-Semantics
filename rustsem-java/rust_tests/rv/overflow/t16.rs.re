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
        #Read ( #pair ( #heap ( 0 , 5 ) , valcl ( true ) ) ) ~> #freezer#letcl1_ ( var ( 2 ) , clskip ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
      </k>
      <env>
        var ( 0 ) |-> #sl ( 0 )
        var ( 1 ) |-> #sl ( 1 )
      </env>
      <clstack>
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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 5 ) , #vec ( i32 ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , valcl ( 4 ) , valcl ( 5 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( fa , #owner ( #vec ( i32 ) ) ) , .Fields ) ) , #move ( var ( 0 ) ) , .ExpCLs ) incl letcl var ( 2 ) =cl #Index ( var ( 1 ) .cl valcl ( 0 ) , valcl ( 5 ) ) incl clskip |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      2
    </slocAddr>
    <sloc>
      0 |-> #uninit ( 0 )
      1 |-> #own ( #blk ( 1 ) )
    </sloc>
    <blkAddr>
      2
    </blkAddr>
    <blocks>
      #heap ( 0 , 0 ) |-> valcl ( 1 )
      #heap ( 0 , 1 ) |-> valcl ( 2 )
      #heap ( 0 , 2 ) |-> valcl ( 3 )
      #heap ( 0 , 3 ) |-> valcl ( 4 )
      #heap ( 0 , 4 ) |-> valcl ( 5 )
      #heap ( 1 , 0 ) |-> #own ( #blk ( 0 ) )
      0 |-> #blkInfo ( 5 , #vec ( i32 ) )
      1 |-> #blkInfo ( 1 , #IdTy ( A , #prod ( #fd ( fa , #owner ( #vec ( i32 ) ) ) , .Fields ) ) )
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 0 ) , 6 ) )
      SetItem ( #lread ( #sl ( 1 ) . valcl ( 0 ) , 10 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 7 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 2 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 3 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 4 ) |-> #ms ( 0 , 0 )
      #heap ( 1 , 0 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
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
        3
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( v , #owner ( #vec ( i32 ) ) , 1 )
        var ( 1 ) |-> varInfo ( a , #owner ( #IdTy ( A , #prod ( #fd ( fa , #owner ( #vec ( i32 ) ) ) , .Fields ) ) ) , 1 )
        var ( 2 ) |-> varInfo ( z , i32 , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
      A |-> #IdTy ( A , #prod ( #fd ( fa , #owner ( #vec ( i32 ) ) ) , .Fields ) )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 5 ) , #vec ( i32 ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , valcl ( 4 ) , valcl ( 5 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( fa , #owner ( #vec ( i32 ) ) ) , .Fields ) ) , #move ( var ( 0 ) ) , .ExpCLs ) incl letcl var ( 2 ) =cl #Index ( var ( 1 ) .cl valcl ( 0 ) , valcl ( 5 ) ) incl clskip |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
