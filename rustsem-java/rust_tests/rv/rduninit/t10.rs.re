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
        #Read ( #pair ( #sl ( 1 ) , valcl ( true ) ) ) ~> #freezer#Move1_ ( #write ( #sl ( 1 ) , #uninit ( 0 ) ) ) ~> #freezer#letcl1_ ( var ( 3 ) , var ( 2 ) :=cl valcl ( 0 ) ;cl clskip ;cl clskip ) ~> clskip ;cl clskip ;cl var ( 0 ) :=cl var ( 0 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip ~> #loopstart ( #loop var ( 0 ) <-cl valcl ( 10 ) { (| ifcl var ( 2 ) thencl (| letcl var ( 3 ) =cl #move ( var ( 1 ) ) incl ( var ( 2 ) :=cl valcl ( 0 ) ;cl clskip ;cl clskip ) |) elsecl (| var ( 2 ) :=cl valcl ( 1 ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl var ( 0 ) :=cl var ( 0 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ) ~> clskip ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
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
        (| letcl var ( 0 ) =cl valcl ( 0 ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 2 ) =cl valcl ( 0 ) incl ( #loop var ( 0 ) <-cl valcl ( 10 ) { (| ifcl var ( 2 ) thencl (| letcl var ( 3 ) =cl #move ( var ( 1 ) ) incl ( var ( 2 ) :=cl valcl ( 0 ) ;cl clskip ;cl clskip ) |) elsecl (| var ( 2 ) :=cl valcl ( 1 ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl var ( 0 ) :=cl var ( 0 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl clskip ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      4
    </slocAddr>
    <sloc>
      0 |-> valcl ( 3 )
      1 |-> #uninit ( 0 )
      2 |-> valcl ( 1 )
    </sloc>
    <blkAddr>
      1
    </blkAddr>
    <blocks>
      .Map
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 0 ) , 5 ) )
      SetItem ( #lread ( #sl ( 0 ) , 8 ) )
      SetItem ( #lread ( #sl ( 0 ) , 10 ) )
      SetItem ( #lread ( #sl ( 0 ) , 16 ) )
      SetItem ( #lread ( #sl ( 0 ) , 18 ) )
      SetItem ( #lread ( #sl ( 0 ) , 21 ) )
      SetItem ( #lread ( #sl ( 0 ) , 23 ) )
      SetItem ( #lread ( #sl ( 1 ) , 12 ) )
      SetItem ( #lread ( #sl ( 1 ) , 25 ) )
      SetItem ( #lread ( #sl ( 2 ) , 6 ) )
      SetItem ( #lread ( #sl ( 2 ) , 11 ) )
      SetItem ( #lread ( #sl ( 2 ) , 19 ) )
      SetItem ( #lread ( #sl ( 2 ) , 24 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 9 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 17 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 22 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 13 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 7 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 15 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 20 ) )
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
      25
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
        var ( 0 ) |-> varInfo ( i , i32 , 1 )
        var ( 1 ) |-> varInfo ( x , #owner ( #array ( i32 , 2 ) ) , 1 )
        var ( 2 ) |-> varInfo ( b , bool , 1 )
        var ( 3 ) |-> varInfo ( z , #owner ( #array ( i32 , 2 ) ) , 3 )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl valcl ( 0 ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 2 ) =cl valcl ( 0 ) incl ( #loop var ( 0 ) <-cl valcl ( 10 ) { (| ifcl var ( 2 ) thencl (| letcl var ( 3 ) =cl #move ( var ( 1 ) ) incl ( var ( 2 ) :=cl valcl ( 0 ) ;cl clskip ;cl clskip ) |) elsecl (| var ( 2 ) :=cl valcl ( 1 ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl var ( 0 ) :=cl var ( 0 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl clskip ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
