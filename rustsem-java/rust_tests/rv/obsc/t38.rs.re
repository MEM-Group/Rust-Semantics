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
        #stuck ( #lwrite ( #sl ( 2 ) , 36 ) , #shr ( 36 , 41 , #PArray ( #sl ( 0 ) , valcl ( 5 ) ) ) ) ~> #readna ( #sl ( 2 ) ) ~> #freezer#letcl1_ ( var ( 3 ) , clskip ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 6 ) , #owner ( #array ( i32 , 6 ) ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , valcl ( 4 ) , valcl ( 5 ) , valcl ( 6 ) , .ExpCLs ) incl letcl var ( 1 ) =cl valcl ( 0 ) incl letcl var ( 2 ) =cl #uninit ( 0 ) incl ( #loop var ( 1 ) <-cl valcl ( 6 ) { (| var ( 2 ) :=cl refcl ( 0 , #Index ( var ( 0 ) , var ( 1 ) ) ) ;cl clskip ;cl clskip ;cl var ( 1 ) :=cl var ( 1 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl #Index ( var ( 0 ) , valcl ( 3 ) ) :=cl sc valcl ( 3 ) ;cl clskip ;cl clskip ;cl letcl var ( 3 ) =cl var ( 2 ) incl clskip ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      3
    </slocAddr>
    <sloc>
      0 |-> #own ( #blk ( 0 ) )
      1 |-> valcl ( 6 )
      2 |-> #shr ( 36 , 41 , #PArray ( #sl ( 0 ) , valcl ( 5 ) ) )
    </sloc>
    <blkAddr>
      1
    </blkAddr>
    <blocks>
      #heap ( 0 , 0 ) |-> valcl ( 1 )
      #heap ( 0 , 1 ) |-> valcl ( 2 )
      #heap ( 0 , 2 ) |-> valcl ( 3 )
      #heap ( 0 , 3 ) |-> valcl ( 3 )
      #heap ( 0 , 4 ) |-> valcl ( 5 )
      #heap ( 0 , 5 ) |-> valcl ( 6 )
      0 |-> #blkInfo ( 6 , #owner ( #array ( i32 , 6 ) ) )
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 1 ) , 9 ) )
      SetItem ( #lread ( #sl ( 1 ) , 10 ) )
      SetItem ( #lread ( #sl ( 1 ) , 12 ) )
      SetItem ( #lread ( #sl ( 1 ) , 14 ) )
      SetItem ( #lread ( #sl ( 1 ) , 15 ) )
      SetItem ( #lread ( #sl ( 1 ) , 17 ) )
      SetItem ( #lread ( #sl ( 1 ) , 19 ) )
      SetItem ( #lread ( #sl ( 1 ) , 20 ) )
      SetItem ( #lread ( #sl ( 1 ) , 22 ) )
      SetItem ( #lread ( #sl ( 1 ) , 24 ) )
      SetItem ( #lread ( #sl ( 1 ) , 25 ) )
      SetItem ( #lread ( #sl ( 1 ) , 27 ) )
      SetItem ( #lread ( #sl ( 1 ) , 29 ) )
      SetItem ( #lread ( #sl ( 1 ) , 30 ) )
      SetItem ( #lread ( #sl ( 1 ) , 32 ) )
      SetItem ( #lread ( #sl ( 1 ) , 34 ) )
      SetItem ( #lread ( #sl ( 1 ) , 35 ) )
      SetItem ( #lread ( #sl ( 1 ) , 37 ) )
      SetItem ( #lread ( #sl ( 1 ) , 39 ) )
      SetItem ( #lread ( #sl ( 2 ) , 41 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 40 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 13 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 18 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 23 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 28 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 33 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 38 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 11 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 16 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 21 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 26 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 31 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 36 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 2 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 3 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 4 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 5 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      42
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
        var ( 0 ) |-> varInfo ( x , #owner ( #array ( i32 , 6 ) ) , 1 )
        var ( 1 ) |-> varInfo ( i , i32 , 1 )
        var ( 2 ) |-> varInfo ( z , #ref ( i32 ) , 1 )
        var ( 3 ) |-> varInfo ( k , #ref ( i32 ) , 1 )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 6 ) , #owner ( #array ( i32 , 6 ) ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , valcl ( 4 ) , valcl ( 5 ) , valcl ( 6 ) , .ExpCLs ) incl letcl var ( 1 ) =cl valcl ( 0 ) incl letcl var ( 2 ) =cl #uninit ( 0 ) incl ( #loop var ( 1 ) <-cl valcl ( 6 ) { (| var ( 2 ) :=cl refcl ( 0 , #Index ( var ( 0 ) , var ( 1 ) ) ) ;cl clskip ;cl clskip ;cl var ( 1 ) :=cl var ( 1 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl #Index ( var ( 0 ) , valcl ( 3 ) ) :=cl sc valcl ( 3 ) ;cl clskip ;cl clskip ;cl letcl var ( 3 ) =cl var ( 2 ) incl clskip ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
