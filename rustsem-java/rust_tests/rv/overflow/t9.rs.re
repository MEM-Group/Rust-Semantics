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
        #unit
      </k>
      <env>
        .Map
      </env>
      <clstack>
        .List
      </clstack>
    </Thread>
    <activeThreads>
      SetItem ( 0 )
    </activeThreads>
    <cntThreads>
      1
    </cntThreads>
    <cthread>
      -1
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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 6 ) , #owner ( #array ( i32 , 6 ) ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , valcl ( 4 ) , valcl ( 5 ) , valcl ( 6 ) , .ExpCLs ) incl letcl var ( 1 ) =cl valcl ( 0 ) incl letcl var ( 2 ) =cl valcl ( 2 ) incl ( #loop var ( 2 ) +cl var ( 1 ) <-cl valcl ( 6 ) { (| #print ( "{}" , #Index ( var ( 0 ) , var ( 2 ) +cl var ( 1 ) ) , .ExpCLs ) ;cl var ( 1 ) :=cl var ( 1 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip ;cl var ( 2 ) :=cl var ( 2 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl clskip ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      3
    </slocAddr>
    <sloc>
      .Map
    </sloc>
    <blkAddr>
      1
    </blkAddr>
    <blocks>
      .Map
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 0 ) , 11 ) )
      SetItem ( #lread ( #sl ( 0 ) , 20 ) )
      SetItem ( #lread ( #sl ( 1 ) , 9 ) )
      SetItem ( #lread ( #sl ( 1 ) , 11 ) )
      SetItem ( #lread ( #sl ( 1 ) , 14 ) )
      SetItem ( #lread ( #sl ( 1 ) , 18 ) )
      SetItem ( #lread ( #sl ( 1 ) , 20 ) )
      SetItem ( #lread ( #sl ( 1 ) , 23 ) )
      SetItem ( #lread ( #sl ( 1 ) , 27 ) )
      SetItem ( #lread ( #sl ( 2 ) , 10 ) )
      SetItem ( #lread ( #sl ( 2 ) , 12 ) )
      SetItem ( #lread ( #sl ( 2 ) , 16 ) )
      SetItem ( #lread ( #sl ( 2 ) , 19 ) )
      SetItem ( #lread ( #sl ( 2 ) , 21 ) )
      SetItem ( #lread ( #sl ( 2 ) , 25 ) )
      SetItem ( #lread ( #sl ( 2 ) , 28 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 15 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 24 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 17 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 26 ) )
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
      29
    </clk>
  </memory>
  <output>
    ListItem ( "5" )
    ListItem ( "3" )
  </output>
  <TCContext>
    <varCtx>
      <varCnt>
        3
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( v , #owner ( #array ( i32 , 6 ) ) , 1 )
        var ( 1 ) |-> varInfo ( i , i32 , 1 )
        var ( 2 ) |-> varInfo ( k , i32 , 1 )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 6 ) , #owner ( #array ( i32 , 6 ) ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , valcl ( 4 ) , valcl ( 5 ) , valcl ( 6 ) , .ExpCLs ) incl letcl var ( 1 ) =cl valcl ( 0 ) incl letcl var ( 2 ) =cl valcl ( 2 ) incl ( #loop var ( 2 ) +cl var ( 1 ) <-cl valcl ( 6 ) { (| #print ( "{}" , #Index ( var ( 0 ) , var ( 2 ) +cl var ( 1 ) ) , .ExpCLs ) ;cl var ( 1 ) :=cl var ( 1 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip ;cl var ( 2 ) :=cl var ( 2 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl clskip ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
