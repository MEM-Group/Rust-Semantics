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
        #Read ( #pair ( #sl ( 1 ) , valcl ( true ) ) ) ~> #freezer#Move1_ ( #write ( #sl ( 1 ) , #uninit ( 0 ) ) ) ~> #freezer#letcl1_ ( var ( 2 ) , var ( 0 ) :=cl var ( 0 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip ) ~> #loopstart ( #loop var ( 0 ) <=cl valcl ( 10 ) { (| letcl var ( 2 ) =cl #move ( var ( 1 ) ) incl ( var ( 0 ) :=cl var ( 0 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip ) |) } ) ~> clskip ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
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
        (| letcl var ( 0 ) =cl valcl ( 0 ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl ( #loop var ( 0 ) <=cl valcl ( 10 ) { (| letcl var ( 2 ) =cl #move ( var ( 1 ) ) incl ( var ( 0 ) :=cl var ( 0 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip ) |) } ;cl clskip ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      3
    </slocAddr>
    <sloc>
      0 |-> valcl ( 1 )
      1 |-> #uninit ( 0 )
    </sloc>
    <blkAddr>
      1
    </blkAddr>
    <blocks>
      .Map
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 0 ) , 4 ) )
      SetItem ( #lread ( #sl ( 0 ) , 8 ) )
      SetItem ( #lread ( #sl ( 0 ) , 10 ) )
      SetItem ( #lread ( #sl ( 1 ) , 5 ) )
      SetItem ( #lread ( #sl ( 1 ) , 11 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 9 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 6 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      11
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
        var ( 0 ) |-> varInfo ( x , i32 , 1 )
        var ( 1 ) |-> varInfo ( z , #owner ( #array ( i32 , 2 ) ) , 1 )
        var ( 2 ) |-> varInfo ( t , #owner ( #array ( i32 , 2 ) ) , 2 )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl valcl ( 0 ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl ( #loop var ( 0 ) <=cl valcl ( 10 ) { (| letcl var ( 2 ) =cl #move ( var ( 1 ) ) incl ( var ( 0 ) :=cl var ( 0 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip ) |) } ;cl clskip ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
