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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 3 ) , #vec ( i32 ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , .ExpCLs ) incl ( assertcl ( valcl ( 1 ) ==cl #Index ( var ( 0 ) , valcl ( 0 ) ) ) ;cl assertcl ( valcl ( 2 ) ==cl #Index ( var ( 0 ) , valcl ( 1 ) ) ) ;cl assertcl ( valcl ( 3 ) ==cl #Index ( var ( 0 ) , valcl ( 2 ) ) ) ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      1
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
      SetItem ( #lread ( #sl ( 0 ) , 4 ) )
      SetItem ( #lread ( #sl ( 0 ) , 5 ) )
      SetItem ( #lread ( #sl ( 0 ) , 6 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 2 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      7
    </clk>
  </memory>
  <output>
    .List
  </output>
  <TCContext>
    <varCtx>
      <varCnt>
        1
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( v , #owner ( #vec ( i32 ) ) , 1 )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 3 ) , #vec ( i32 ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , .ExpCLs ) incl ( assertcl ( valcl ( 1 ) ==cl #Index ( var ( 0 ) , valcl ( 0 ) ) ) ;cl assertcl ( valcl ( 2 ) ==cl #Index ( var ( 0 ) , valcl ( 1 ) ) ) ;cl assertcl ( valcl ( 3 ) ==cl #Index ( var ( 0 ) , valcl ( 2 ) ) ) ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
