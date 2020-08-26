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
      2
    </closureCnt>
    <funclosure>
      f |-> 1
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
        (| letcl var ( 2 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 3 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 4 ) =cl callcl ( f , refcl ( 0 , var ( 2 ) ) , refcl ( 0 , var ( 3 ) ) , .ExpCLs ) incl letcl var ( 5 ) =cl refcl ( 1 , var ( 2 ) ) incl letcl var ( 6 ) =cl var ( 4 ) incl clskip |)
      </crBody>
    </closure> <closure>
      <crId>
        1
      </crId>
      <crContext>
        .
      </crContext>
      <crParams>
        var ( 0 ) , var ( 1 ) , .Idents
      </crParams>
      <crBody>
        (| var ( 1 ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      7
    </slocAddr>
    <sloc>
      .Map
    </sloc>
    <blkAddr>
      2
    </blkAddr>
    <blocks>
      .Map
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 3 ) , 8 ) )
      SetItem ( #lread ( #sl ( 4 ) , 11 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #heap ( 1 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 1 , 1 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
      #sl ( 3 ) |-> #ms ( 0 , 0 )
      #sl ( 4 ) |-> #ms ( 0 , 0 )
      #sl ( 5 ) |-> #ms ( 0 , 0 )
      #sl ( 6 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      13
    </clk>
  </memory>
  <output>
    .List
  </output>
  <TCContext>
    <varCtx>
      <varCnt>
        7
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( x , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
        var ( 1 ) |-> varInfo ( y , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
        var ( 2 ) |-> varInfo ( x , #owner ( #array ( i32 , 2 ) ) , 1 )
        var ( 3 ) |-> varInfo ( y , #owner ( #array ( i32 , 2 ) ) , 1 )
        var ( 4 ) |-> varInfo ( z , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
        var ( 5 ) |-> varInfo ( t , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
        var ( 6 ) |-> varInfo ( b , #ref ( #owner ( #array ( i32 , 2 ) ) ) , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
      f |-> fnTy ( #ref ( #owner ( #array ( i32 , 2 ) ) ) , #ref ( #owner ( #array ( i32 , 2 ) ) ) , .CoreTys ) -> #ref ( #owner ( #array ( i32 , 2 ) ) )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 2 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 3 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 4 ) =cl callcl ( f , refcl ( 0 , var ( 2 ) ) , refcl ( 0 , var ( 3 ) ) , .ExpCLs ) incl letcl var ( 5 ) =cl refcl ( 1 , var ( 2 ) ) incl letcl var ( 6 ) =cl var ( 4 ) incl clskip |) } ;cl fun f ( var ( 0 ) , var ( 1 ) , .Idents ) { (| var ( 1 ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
