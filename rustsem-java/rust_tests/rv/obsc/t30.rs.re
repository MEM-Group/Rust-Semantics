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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , #fd ( b , bool ) , .Fields ) ) , valcl ( 1 ) , valcl ( 0 ) , .ExpCLs ) incl letcl var ( 1 ) =cl refcl ( 1 , var ( 0 ) .cl valcl ( 0 ) ) incl letcl var ( 2 ) =cl refcl ( 1 , var ( 0 ) .cl valcl ( 1 ) ) incl ( *cl na var ( 1 ) :=cl sc valcl ( 2 ) ;cl clskip ;cl clskip ;cl *cl na var ( 2 ) :=cl sc valcl ( 1 ) ;cl clskip ;cl clskip ;cl #print ( "{} {}" , var ( 0 ) .cl valcl ( 0 ) , var ( 0 ) .cl valcl ( 1 ) , .ExpCLs ) ) |)
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
      SetItem ( #lread ( #sl ( 0 ) . valcl ( 0 ) , 7 ) )
      SetItem ( #lread ( #sl ( 0 ) . valcl ( 1 ) , 8 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 5 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 6 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      9
    </clk>
  </memory>
  <output>
    ListItem ( "2 1" )
  </output>
  <TCContext>
    <varCtx>
      <varCnt>
        3
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( x , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , #fd ( b , bool ) , .Fields ) ) ) , 1 )
        var ( 1 ) |-> varInfo ( b , #ref ( i32 ) , 1 )
        var ( 2 ) |-> varInfo ( z , #ref ( bool ) , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
      A |-> #IdTy ( A , #prod ( #fd ( a , i32 ) , #fd ( b , bool ) , .Fields ) )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , #fd ( b , bool ) , .Fields ) ) , valcl ( 1 ) , valcl ( 0 ) , .ExpCLs ) incl letcl var ( 1 ) =cl refcl ( 1 , var ( 0 ) .cl valcl ( 0 ) ) incl letcl var ( 2 ) =cl refcl ( 1 , var ( 0 ) .cl valcl ( 1 ) ) incl ( *cl na var ( 1 ) :=cl sc valcl ( 2 ) ;cl clskip ;cl clskip ;cl *cl na var ( 2 ) :=cl sc valcl ( 1 ) ;cl clskip ;cl clskip ;cl #print ( "{} {}" , var ( 0 ) .cl valcl ( 0 ) , var ( 0 ) .cl valcl ( 1 ) , .ExpCLs ) ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
