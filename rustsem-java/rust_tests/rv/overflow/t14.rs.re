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
        #Read ( #pair ( #heap ( 0 , 4 ) , valcl ( false ) ) ) ~> #freezer#computeFB0_ ( )
      </k>
      <env>
        var ( 0 ) |-> #sl ( 7 )
        var ( 1 ) |-> #sl ( 8 )
        var ( 2 ) |-> #sl ( 0 )
      </env>
      <clstack>
        ListItem ( var ( 1 ) )
        ListItem ( var ( 0 ) )
        ListItem ( #state ( clskip ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) , var ( 2 ) |-> #sl ( 0 ) ) )
        ListItem ( var ( 2 ) )
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
      fa |-> 1
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
        (| letcl var ( 2 ) =cl #AllocateInit ( valcl ( 4 ) , #vec ( i32 ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , valcl ( 4 ) , .ExpCLs ) incl ( callcl ( fa , refcl ( 0 , var ( 2 ) ) , valcl ( 1 ) , .ExpCLs ) ;cl clskip ;cl callcl ( fa , refcl ( 0 , var ( 2 ) ) , valcl ( 2 ) , .ExpCLs ) ;cl clskip ;cl callcl ( fa , refcl ( 0 , var ( 2 ) ) , valcl ( 3 ) , .ExpCLs ) ;cl clskip ;cl callcl ( fa , refcl ( 0 , var ( 2 ) ) , valcl ( 4 ) , .ExpCLs ) ;cl clskip ) |)
      </crBody>
    </closure> <closure>
      <crId>
        1
      </crId>
      <crContext>
        .
      </crContext>
      <crParams>
        var ( 0 ) , var ( 1 ) , .Idents
      </crParams>
      <crBody>
        (| #Index ( *cl na var ( 0 ) , var ( 1 ) ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      9
    </slocAddr>
    <sloc>
      0 |-> #own ( #blk ( 0 ) )
      7 |-> #shr ( 17 , 20 , #sl ( 0 ) )
      8 |-> valcl ( 4 )
    </sloc>
    <blkAddr>
      1
    </blkAddr>
    <blocks>
      #heap ( 0 , 0 ) |-> valcl ( 1 )
      #heap ( 0 , 1 ) |-> valcl ( 2 )
      #heap ( 0 , 2 ) |-> valcl ( 3 )
      #heap ( 0 , 3 ) |-> valcl ( 4 )
      0 |-> #blkInfo ( 4 , #vec ( i32 ) )
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 1 ) , 7 ) )
      SetItem ( #lread ( #sl ( 2 ) , 7 ) )
      SetItem ( #lread ( #sl ( 3 ) , 11 ) )
      SetItem ( #lread ( #sl ( 4 ) , 11 ) )
      SetItem ( #lread ( #sl ( 5 ) , 15 ) )
      SetItem ( #lread ( #sl ( 6 ) , 15 ) )
      SetItem ( #lread ( #sl ( 7 ) , 19 ) )
      SetItem ( #lread ( #sl ( 8 ) , 19 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 2 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 3 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
      #sl ( 3 ) |-> #ms ( 0 , 0 )
      #sl ( 4 ) |-> #ms ( 0 , 0 )
      #sl ( 5 ) |-> #ms ( 0 , 0 )
      #sl ( 6 ) |-> #ms ( 0 , 0 )
      #sl ( 7 ) |-> #ms ( 0 , 0 )
      #sl ( 8 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      20
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
        var ( 0 ) |-> varInfo ( x , #ref ( #owner ( #vec ( i32 ) ) ) , 1 )
        var ( 1 ) |-> varInfo ( i , i32 , 1 )
        var ( 2 ) |-> varInfo ( v , #owner ( #vec ( i32 ) ) , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
      fa |-> fnTy ( #ref ( #owner ( #vec ( i32 ) ) ) , i32 , .CoreTys ) -> i32
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 2 ) =cl #AllocateInit ( valcl ( 4 ) , #vec ( i32 ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , valcl ( 4 ) , .ExpCLs ) incl ( callcl ( fa , refcl ( 0 , var ( 2 ) ) , valcl ( 1 ) , .ExpCLs ) ;cl clskip ;cl callcl ( fa , refcl ( 0 , var ( 2 ) ) , valcl ( 2 ) , .ExpCLs ) ;cl clskip ;cl callcl ( fa , refcl ( 0 , var ( 2 ) ) , valcl ( 3 ) , .ExpCLs ) ;cl clskip ;cl callcl ( fa , refcl ( 0 , var ( 2 ) ) , valcl ( 4 ) , .ExpCLs ) ;cl clskip ) |) } ;cl fun fa ( var ( 0 ) , var ( 1 ) , .Idents ) { (| #Index ( *cl na var ( 0 ) , var ( 1 ) ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
