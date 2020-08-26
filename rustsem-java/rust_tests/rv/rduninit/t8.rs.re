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
        #Read ( #pair ( #sl ( 1 ) , valcl ( true ) ) ) ~> #freezer#ExpCLs1_ ( .ExpCLs ) ~> #freezer#print0_ ( "{}" ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #IdTy ( Tt , #sum ( #fd ( ea , #IdTy ( ea , #prod ( #fd ( #noName , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , #fd ( b , #IdTy ( b , #prod ( #fd ( #noName , i32 ) , .Fields ) ) ) , .Fields ) ) , valcl ( 0 ) , #AllocateInit ( valcl ( 1 ) , #IdTy ( ea , #prod ( #fd ( #noName , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) , #move ( var ( 0 ) ) , .ExpCLs ) , .ExpCLs ) incl letcl var ( 2 ) =cl #move ( var ( 1 ) ) incl #print ( "{}" , var ( 1 ) , .ExpCLs ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      3
    </slocAddr>
    <sloc>
      0 |-> #uninit ( 0 )
      1 |-> #uninit ( 0 )
      2 |-> #own ( #blk ( 2 ) )
    </sloc>
    <blkAddr>
      3
    </blkAddr>
    <blocks>
      #heap ( 0 , 0 ) |-> valcl ( 2 )
      #heap ( 1 , 0 ) |-> #own ( #blk ( 0 ) )
      #heap ( 2 , 0 ) |-> valcl ( 0 )
      #heap ( 2 , 1 ) |-> #own ( #blk ( 1 ) )
      0 |-> #blkInfo ( 1 , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) )
      1 |-> #blkInfo ( 1 , #IdTy ( ea , #prod ( #fd ( #noName , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) )
      2 |-> #blkInfo ( 2 , #IdTy ( Tt , #sum ( #fd ( ea , #IdTy ( ea , #prod ( #fd ( #noName , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , #fd ( b , #IdTy ( b , #prod ( #fd ( #noName , i32 ) , .Fields ) ) ) , .Fields ) ) )
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 0 ) , 2 ) )
      SetItem ( #lread ( #sl ( 1 ) , 8 ) )
      SetItem ( #lread ( #sl ( 1 ) , 11 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 3 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 9 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 1 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 2 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 2 , 1 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      11
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
        var ( 0 ) |-> varInfo ( A1 , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 1 )
        var ( 1 ) |-> varInfo ( z , #owner ( #IdTy ( Tt , #sum ( #fd ( ea , #IdTy ( ea , #prod ( #fd ( #noName , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , #fd ( b , #IdTy ( b , #prod ( #fd ( #noName , i32 ) , .Fields ) ) ) , .Fields ) ) ) , 1 )
        var ( 2 ) |-> varInfo ( k , #owner ( #IdTy ( Tt , #sum ( #fd ( ea , #IdTy ( ea , #prod ( #fd ( #noName , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , #fd ( b , #IdTy ( b , #prod ( #fd ( #noName , i32 ) , .Fields ) ) ) , .Fields ) ) ) , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
      A |-> #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) )
      Tt |-> #IdTy ( Tt , #sum ( #fd ( ea , #IdTy ( ea , #prod ( #fd ( #noName , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , #fd ( b , #IdTy ( b , #prod ( #fd ( #noName , i32 ) , .Fields ) ) ) , .Fields ) )
      b |-> #IdTy ( b , #prod ( #fd ( #noName , i32 ) , .Fields ) )
      ea |-> #IdTy ( ea , #prod ( #fd ( #noName , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #IdTy ( Tt , #sum ( #fd ( ea , #IdTy ( ea , #prod ( #fd ( #noName , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , #fd ( b , #IdTy ( b , #prod ( #fd ( #noName , i32 ) , .Fields ) ) ) , .Fields ) ) , valcl ( 0 ) , #AllocateInit ( valcl ( 1 ) , #IdTy ( ea , #prod ( #fd ( #noName , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) , #move ( var ( 0 ) ) , .ExpCLs ) , .ExpCLs ) incl letcl var ( 2 ) =cl #move ( var ( 1 ) ) incl #print ( "{}" , var ( 1 ) , .ExpCLs ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
