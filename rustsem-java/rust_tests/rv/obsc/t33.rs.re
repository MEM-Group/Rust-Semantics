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
        #stuck ( #mut ( 6 , 6 , #sl ( 0 ) ) , #shr ( 5 , 7 , #sl ( 0 ) ) ) ~> #ckRefLT ( .Map , 2 , #shr ( 5 , 7 , #sl ( 0 ) ) ) ~> #ckRefLT ( #heap ( 0 , 0 ) |-> valcl ( 1 )
        #heap ( 0 , 1 ) |-> valcl ( 2 )
        0 |-> #blkInfo ( 2 , #owner ( #array ( i32 , 2 ) ) ) , 2 , #shr ( 5 , 7 , #sl ( 0 ) ) ) ~> #wellFormAct ( #shr ( 5 , 7 , #sl ( 0 ) ) ) ~> #readna ( #sl ( 2 ) ) ~> #freezer#letcl1_ ( var ( 4 ) , clskip ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
      </k>
      <env>
        var ( 1 ) |-> #sl ( 0 )
        var ( 2 ) |-> #sl ( 2 )
        var ( 3 ) |-> #sl ( 3 )
      </env>
      <clstack>
        ListItem ( var ( 3 ) )
        ListItem ( var ( 1 ) |-> #sl ( 0 )
        var ( 2 ) |-> #sl ( 2 ) )
        ListItem ( var ( 2 ) )
        ListItem ( var ( 1 ) |-> #sl ( 0 ) )
        ListItem ( var ( 1 ) )
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
      2
    </closureCnt>
    <funclosure>
      f |-> 1
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
        (| letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 2 ) =cl callcl ( f , refcl ( 0 , var ( 1 ) ) , .ExpCLs ) incl letcl var ( 3 ) =cl refcl ( 1 , var ( 1 ) ) incl letcl var ( 4 ) =cl var ( 2 ) incl clskip |)
      </crBody>
    </closure> <closure>
      <crId>
        1
      </crId>
      <crContext>
        .
      </crContext>
      <crParams>
        var ( 0 ) , .Idents
      </crParams>
      <crBody>
        (| var ( 0 ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      4
    </slocAddr>
    <sloc>
      0 |-> #own ( #blk ( 0 ) )
      2 |-> #shr ( 5 , 7 , #sl ( 0 ) )
      3 |-> #mut ( 6 , 6 , #sl ( 0 ) )
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
      SetItem ( #lread ( #sl ( 1 ) , 4 ) )
      SetItem ( #lread ( #sl ( 2 ) , 7 ) )
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
        var ( 0 ) |-> varInfo ( x , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
        var ( 1 ) |-> varInfo ( x , #owner ( #array ( i32 , 2 ) ) , 1 )
        var ( 2 ) |-> varInfo ( z , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
        var ( 3 ) |-> varInfo ( t , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
        var ( 4 ) |-> varInfo ( b , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
      f |-> fnTy ( #ref ( #owner ( #array ( i32 , 2 ) ) ) , .CoreTys ) -> #ref ( #owner ( #array ( i32 , 2 ) ) )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 2 ) =cl callcl ( f , refcl ( 0 , var ( 1 ) ) , .ExpCLs ) incl letcl var ( 3 ) =cl refcl ( 1 , var ( 1 ) ) incl letcl var ( 4 ) =cl var ( 2 ) incl clskip |) } ;cl fun f ( var ( 0 ) , .Idents ) { (| var ( 0 ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
