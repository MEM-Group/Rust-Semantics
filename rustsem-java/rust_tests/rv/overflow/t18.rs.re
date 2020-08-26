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
        #Read ( #pair ( #heap ( 0 , 5 ) , valcl ( true ) ) ) ~> #freezer#writecl0_ ( #sl ( 2 ) ) ~> clskip ;cl clskip ~> clskip ;cl clskip ;cl #print ( "{}" , var ( 2 ) , .ExpCLs ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 5 ) , #owner ( #array ( i32 , 5 ) ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , valcl ( 4 ) , valcl ( 5 ) , .ExpCLs ) incl letcl var ( 1 ) =cl valcl ( 1 ) incl letcl var ( 2 ) =cl #uninit ( 0 ) incl ( ifcl var ( 1 ) thencl (| var ( 2 ) :=cl #Index ( var ( 0 ) , valcl ( 5 ) ) ;cl clskip ;cl clskip |) elsecl (| var ( 2 ) :=cl #Index ( var ( 0 ) , valcl ( 4 ) ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl #print ( "{}" , var ( 2 ) , .ExpCLs ) ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      3
    </slocAddr>
    <sloc>
      0 |-> #own ( #blk ( 0 ) )
      1 |-> valcl ( 1 )
      2 |-> #uninit ( 0 )
    </sloc>
    <blkAddr>
      1
    </blkAddr>
    <blocks>
      #heap ( 0 , 0 ) |-> valcl ( 1 )
      #heap ( 0 , 1 ) |-> valcl ( 2 )
      #heap ( 0 , 2 ) |-> valcl ( 3 )
      #heap ( 0 , 3 ) |-> valcl ( 4 )
      #heap ( 0 , 4 ) |-> valcl ( 5 )
      0 |-> #blkInfo ( 5 , #owner ( #array ( i32 , 5 ) ) )
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 0 ) , 9 ) )
      SetItem ( #lread ( #sl ( 1 ) , 8 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 2 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 3 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 4 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      9
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
        var ( 0 ) |-> varInfo ( v , #owner ( #array ( i32 , 5 ) ) , 1 )
        var ( 1 ) |-> varInfo ( b , bool , 1 )
        var ( 2 ) |-> varInfo ( e , i32 , 1 )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 5 ) , #owner ( #array ( i32 , 5 ) ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , valcl ( 4 ) , valcl ( 5 ) , .ExpCLs ) incl letcl var ( 1 ) =cl valcl ( 1 ) incl letcl var ( 2 ) =cl #uninit ( 0 ) incl ( ifcl var ( 1 ) thencl (| var ( 2 ) :=cl #Index ( var ( 0 ) , valcl ( 5 ) ) ;cl clskip ;cl clskip |) elsecl (| var ( 2 ) :=cl #Index ( var ( 0 ) , valcl ( 4 ) ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl #print ( "{}" , var ( 2 ) , .ExpCLs ) ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
