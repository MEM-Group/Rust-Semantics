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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 5 ) , #owner ( #array ( i32 , 5 ) ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , valcl ( 4 ) , valcl ( 5 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #Index ( var ( 0 ) , valcl ( 2 ) ) incl #print ( "{},{}" , #Index ( var ( 0 ) , valcl ( 2 ) ) , var ( 1 ) , .ExpCLs ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      2
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
      SetItem ( #lread ( #sl ( 0 ) , 6 ) )
      SetItem ( #lread ( #sl ( 0 ) , 8 ) )
      SetItem ( #lread ( #sl ( 1 ) , 9 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 2 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 3 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 4 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      10
    </clk>
  </memory>
  <output>
    ListItem ( "3,3" )
  </output>
  <TCContext>
    <varCtx>
      <varCnt>
        2
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( v , #owner ( #array ( i32 , 5 ) ) , 1 )
        var ( 1 ) |-> varInfo ( t , i32 , 1 )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 5 ) , #owner ( #array ( i32 , 5 ) ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , valcl ( 4 ) , valcl ( 5 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #Index ( var ( 0 ) , valcl ( 2 ) ) incl #print ( "{},{}" , #Index ( var ( 0 ) , valcl ( 2 ) ) , var ( 1 ) , .ExpCLs ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
