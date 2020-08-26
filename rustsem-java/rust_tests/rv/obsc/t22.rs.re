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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #uninit ( 0 ) incl ( ifcl valcl ( 0 ) thencl (| letcl var ( 2 ) =cl refcl ( 1 , var ( 0 ) ) incl clskip |) elsecl (| var ( 1 ) :=cl refcl ( 0 , var ( 0 ) ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl letcl var ( 3 ) =cl #Index ( var ( 0 ) , valcl ( 1 ) ) incl letcl var ( 4 ) =cl var ( 1 ) incl clskip ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      4
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
      SetItem ( #lread ( #sl ( 1 ) , 7 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 4 ) )
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
      9
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
        var ( 0 ) |-> varInfo ( x , #owner ( #array ( i32 , 2 ) ) , 1 )
        var ( 1 ) |-> varInfo ( y , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
        var ( 2 ) |-> varInfo ( z , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 2 )
        var ( 3 ) |-> varInfo ( x1 , i32 , 1 )
        var ( 4 ) |-> varInfo ( z , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #uninit ( 0 ) incl ( ifcl valcl ( 0 ) thencl (| letcl var ( 2 ) =cl refcl ( 1 , var ( 0 ) ) incl clskip |) elsecl (| var ( 1 ) :=cl refcl ( 0 , var ( 0 ) ) ;cl clskip ;cl clskip |) ;cl clskip ;cl clskip ;cl letcl var ( 3 ) =cl #Index ( var ( 0 ) , valcl ( 1 ) ) incl letcl var ( 4 ) =cl var ( 1 ) incl clskip ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
