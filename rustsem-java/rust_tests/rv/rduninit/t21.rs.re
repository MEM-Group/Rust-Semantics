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
        (| letcl var ( 0 ) =cl valcl ( 0 ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 2 ) =cl valcl ( 0 ) incl ( #loop var ( 0 ) <-cl valcl ( 10 ) { (| ifcl var ( 2 ) thencl (| letcl var ( 3 ) =cl #move ( var ( 1 ) ) incl ( var ( 2 ) :=cl valcl ( 1 ) ;cl clskip ;cl clskip ) |) elsecl (| var ( 2 ) :=cl valcl ( 0 ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl var ( 0 ) :=cl var ( 0 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl clskip ) |)
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
      SetItem ( #lread ( #sl ( 0 ) , 5 ) )
      SetItem ( #lread ( #sl ( 0 ) , 8 ) )
      SetItem ( #lread ( #sl ( 0 ) , 10 ) )
      SetItem ( #lread ( #sl ( 0 ) , 13 ) )
      SetItem ( #lread ( #sl ( 0 ) , 15 ) )
      SetItem ( #lread ( #sl ( 0 ) , 18 ) )
      SetItem ( #lread ( #sl ( 0 ) , 20 ) )
      SetItem ( #lread ( #sl ( 0 ) , 23 ) )
      SetItem ( #lread ( #sl ( 0 ) , 25 ) )
      SetItem ( #lread ( #sl ( 0 ) , 28 ) )
      SetItem ( #lread ( #sl ( 0 ) , 30 ) )
      SetItem ( #lread ( #sl ( 0 ) , 33 ) )
      SetItem ( #lread ( #sl ( 0 ) , 35 ) )
      SetItem ( #lread ( #sl ( 0 ) , 38 ) )
      SetItem ( #lread ( #sl ( 0 ) , 40 ) )
      SetItem ( #lread ( #sl ( 0 ) , 43 ) )
      SetItem ( #lread ( #sl ( 0 ) , 45 ) )
      SetItem ( #lread ( #sl ( 0 ) , 48 ) )
      SetItem ( #lread ( #sl ( 0 ) , 50 ) )
      SetItem ( #lread ( #sl ( 0 ) , 53 ) )
      SetItem ( #lread ( #sl ( 0 ) , 55 ) )
      SetItem ( #lread ( #sl ( 2 ) , 6 ) )
      SetItem ( #lread ( #sl ( 2 ) , 11 ) )
      SetItem ( #lread ( #sl ( 2 ) , 16 ) )
      SetItem ( #lread ( #sl ( 2 ) , 21 ) )
      SetItem ( #lread ( #sl ( 2 ) , 26 ) )
      SetItem ( #lread ( #sl ( 2 ) , 31 ) )
      SetItem ( #lread ( #sl ( 2 ) , 36 ) )
      SetItem ( #lread ( #sl ( 2 ) , 41 ) )
      SetItem ( #lread ( #sl ( 2 ) , 46 ) )
      SetItem ( #lread ( #sl ( 2 ) , 51 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 9 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 14 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 19 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 24 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 29 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 34 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 39 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 44 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 49 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 54 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 7 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 12 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 17 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 22 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 27 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 32 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 37 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 42 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 47 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 52 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      56
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl valcl ( 0 ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 2 ) =cl valcl ( 0 ) incl ( #loop var ( 0 ) <-cl valcl ( 10 ) { (| ifcl var ( 2 ) thencl (| letcl var ( 3 ) =cl #move ( var ( 1 ) ) incl ( var ( 2 ) :=cl valcl ( 1 ) ;cl clskip ;cl clskip ) |) elsecl (| var ( 2 ) :=cl valcl ( 0 ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl var ( 0 ) :=cl var ( 0 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl clskip ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
