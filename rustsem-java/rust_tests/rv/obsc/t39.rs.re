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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #IdTy ( B , #prod ( #fd ( fa , i32 ) , #fd ( fb , i32 ) , .Fields ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl valcl ( 0 ) incl letcl var ( 2 ) =cl #uninit ( 0 ) incl letcl var ( 3 ) =cl #uninit ( 0 ) incl ( #loop var ( 1 ) <-cl valcl ( 2 ) { (| ifcl var ( 1 ) ==cl valcl ( 0 ) thencl (| clskip |) elsecl (| var ( 2 ) :=cl refcl ( 1 , var ( 0 ) .cl valcl ( 0 ) ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl ifcl var ( 1 ) ==cl valcl ( 1 ) thencl (| clskip |) elsecl (| var ( 3 ) :=cl refcl ( 1 , var ( 0 ) .cl valcl ( 1 ) ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl var ( 1 ) :=cl var ( 1 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl letcl var ( 4 ) =cl var ( 2 ) incl clskip ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      5
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
      SetItem ( #lread ( #sl ( 1 ) , 6 ) )
      SetItem ( #lread ( #sl ( 1 ) , 7 ) )
      SetItem ( #lread ( #sl ( 1 ) , 9 ) )
      SetItem ( #lread ( #sl ( 1 ) , 10 ) )
      SetItem ( #lread ( #sl ( 1 ) , 12 ) )
      SetItem ( #lread ( #sl ( 1 ) , 13 ) )
      SetItem ( #lread ( #sl ( 1 ) , 14 ) )
      SetItem ( #lread ( #sl ( 1 ) , 16 ) )
      SetItem ( #lread ( #sl ( 1 ) , 18 ) )
      SetItem ( #lread ( #sl ( 2 ) , 19 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 11 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 17 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 8 ) )
      SetItem ( #lwrite ( #sl ( 3 ) , 15 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
      #sl ( 3 ) |-> #ms ( 0 , 0 )
      #sl ( 4 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      21
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
        var ( 0 ) |-> varInfo ( x , #owner ( #IdTy ( B , #prod ( #fd ( fa , i32 ) , #fd ( fb , i32 ) , .Fields ) ) ) , 1 )
        var ( 1 ) |-> varInfo ( i , i32 , 1 )
        var ( 2 ) |-> varInfo ( z1 , #ref ( i32 ) , 1 )
        var ( 3 ) |-> varInfo ( z2 , #ref ( i32 ) , 1 )
        var ( 4 ) |-> varInfo ( t , #ref ( i32 ) , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
      B |-> #IdTy ( B , #prod ( #fd ( fa , i32 ) , #fd ( fb , i32 ) , .Fields ) )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #IdTy ( B , #prod ( #fd ( fa , i32 ) , #fd ( fb , i32 ) , .Fields ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl valcl ( 0 ) incl letcl var ( 2 ) =cl #uninit ( 0 ) incl letcl var ( 3 ) =cl #uninit ( 0 ) incl ( #loop var ( 1 ) <-cl valcl ( 2 ) { (| ifcl var ( 1 ) ==cl valcl ( 0 ) thencl (| clskip |) elsecl (| var ( 2 ) :=cl refcl ( 1 , var ( 0 ) .cl valcl ( 0 ) ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl ifcl var ( 1 ) ==cl valcl ( 1 ) thencl (| clskip |) elsecl (| var ( 3 ) :=cl refcl ( 1 , var ( 0 ) .cl valcl ( 1 ) ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl var ( 1 ) :=cl var ( 1 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl letcl var ( 4 ) =cl var ( 2 ) incl clskip ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
