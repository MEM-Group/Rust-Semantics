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
        #Read ( #pair ( #sl ( 0 ) , valcl ( true ) ) ) ~> #freezer#Move1_ ( #write ( #sl ( 0 ) , #uninit ( 0 ) ) ) ~> #freezer#letcl1_ ( var ( 2 ) , clskip ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
      </k>
      <env>
        var ( 1 ) |-> #sl ( 0 )
      </env>
      <clstack>
        ListItem ( var ( 1 ) )
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
      2
    </closureCnt>
    <funclosure>
      #cpath ( #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , f ) |-> 1
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
        (| letcl var ( 1 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 2 ) , .ExpCLs ) incl ( callcl ( #cpath ( #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , f ) , #move ( var ( 1 ) ) , .ExpCLs ) ;cl clskip ;cl letcl var ( 2 ) =cl #move ( var ( 1 ) ) incl clskip ) |)
      </crBody>
    </closure> <closure>
      <crId>
        1
      </crId>
      <crContext>
        .
      </crContext>
      <crParams>
        var ( 0 ) , .Idents
      </crParams>
      <crBody>
        (| clskip |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      2
    </slocAddr>
    <sloc>
      0 |-> #uninit ( 0 )
    </sloc>
    <blkAddr>
      1
    </blkAddr>
    <blocks>
      .Map
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 0 ) , 2 ) )
      SetItem ( #lread ( #sl ( 0 ) , 5 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 3 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      5
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
        var ( 0 ) |-> varInfo ( #selfX , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 1 )
        var ( 1 ) |-> varInfo ( x , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 1 )
        var ( 2 ) |-> varInfo ( z , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
      #cpath ( #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , f ) |-> fnTy ( #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , .CoreTys ) -> #void
      A |-> #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 1 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 2 ) , .ExpCLs ) incl ( callcl ( #cpath ( #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , f ) , #move ( var ( 1 ) ) , .ExpCLs ) ;cl clskip ;cl letcl var ( 2 ) =cl #move ( var ( 1 ) ) incl clskip ) |) } ;cl fun #cpath ( #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , f ) ( var ( 0 ) , .Idents ) { (| clskip |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
