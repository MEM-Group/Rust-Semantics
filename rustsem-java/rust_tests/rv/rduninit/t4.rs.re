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
        #readnap ( #heap ( 5 , 2 ) ) ~> #freezer#rdLVfield1_ ( valcl ( true ) , valcl ( 0 ) ) ~> #freezer#Read0_ ( ) ~> #freezer#ExpCLs1_ ( .ExpCLs ) ~> #freezer#print0_ ( "{}" ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
      </k>
      <env>
        var ( 0 ) |-> #sl ( 0 )
        var ( 1 ) |-> #sl ( 1 )
        var ( 2 ) |-> #sl ( 2 )
        var ( 3 ) |-> #sl ( 3 )
        var ( 4 ) |-> #sl ( 4 )
        var ( 5 ) |-> #sl ( 5 )
        var ( 6 ) |-> #sl ( 6 )
      </env>
      <clstack>
        ListItem ( var ( 6 ) )
        ListItem ( var ( 0 ) |-> #sl ( 0 )
        var ( 1 ) |-> #sl ( 1 )
        var ( 2 ) |-> #sl ( 2 )
        var ( 3 ) |-> #sl ( 3 )
        var ( 4 ) |-> #sl ( 4 )
        var ( 5 ) |-> #sl ( 5 ) )
        ListItem ( var ( 5 ) )
        ListItem ( var ( 0 ) |-> #sl ( 0 )
        var ( 1 ) |-> #sl ( 1 )
        var ( 2 ) |-> #sl ( 2 )
        var ( 3 ) |-> #sl ( 3 )
        var ( 4 ) |-> #sl ( 4 ) )
        ListItem ( var ( 4 ) )
        ListItem ( var ( 0 ) |-> #sl ( 0 )
        var ( 1 ) |-> #sl ( 1 )
        var ( 2 ) |-> #sl ( 2 )
        var ( 3 ) |-> #sl ( 3 ) )
        ListItem ( var ( 3 ) )
        ListItem ( var ( 0 ) |-> #sl ( 0 )
        var ( 1 ) |-> #sl ( 1 )
        var ( 2 ) |-> #sl ( 2 ) )
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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 0 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 1 ) , .ExpCLs ) incl letcl var ( 2 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 3 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 3 ) , .ExpCLs ) incl letcl var ( 4 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 4 ) , .ExpCLs ) incl letcl var ( 5 ) =cl #AllocateInit ( valcl ( 5 ) , #owner ( #array ( #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 5 ) ) , #move ( var ( 0 ) ) , #move ( var ( 1 ) ) , #move ( var ( 2 ) ) , #move ( var ( 3 ) ) , #move ( var ( 4 ) ) , .ExpCLs ) incl letcl var ( 6 ) =cl #move ( #Index ( var ( 5 ) , valcl ( 2 ) ) ) incl #print ( "{}" , #Index ( var ( 5 ) , valcl ( 2 ) ) .cl valcl ( 0 ) , .ExpCLs ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      7
    </slocAddr>
    <sloc>
      0 |-> #uninit ( 0 )
      1 |-> #uninit ( 0 )
      2 |-> #uninit ( 0 )
      3 |-> #uninit ( 0 )
      4 |-> #uninit ( 0 )
      5 |-> #own ( #blk ( 5 ) )
      6 |-> #own ( #blk ( 2 ) )
    </sloc>
    <blkAddr>
      6
    </blkAddr>
    <blocks>
      #heap ( 0 , 0 ) |-> valcl ( 0 )
      #heap ( 1 , 0 ) |-> valcl ( 1 )
      #heap ( 2 , 0 ) |-> valcl ( 2 )
      #heap ( 3 , 0 ) |-> valcl ( 3 )
      #heap ( 4 , 0 ) |-> valcl ( 4 )
      #heap ( 5 , 0 ) |-> #own ( #blk ( 0 ) )
      #heap ( 5 , 1 ) |-> #own ( #blk ( 1 ) )
      #heap ( 5 , 2 ) |-> #uninit ( 0 )
      #heap ( 5 , 3 ) |-> #own ( #blk ( 3 ) )
      #heap ( 5 , 4 ) |-> #own ( #blk ( 4 ) )
      0 |-> #blkInfo ( 1 , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) )
      1 |-> #blkInfo ( 1 , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) )
      2 |-> #blkInfo ( 1 , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) )
      3 |-> #blkInfo ( 1 , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) )
      4 |-> #blkInfo ( 1 , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) )
      5 |-> #blkInfo ( 5 , #owner ( #array ( #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 5 ) ) )
    </blocks>
    <locRW>
      SetItem ( #lread ( #route ( #PArray ( #sl ( 5 ) , valcl ( 2 ) ) . valcl ( 0 ) ) , 29 ) )
      SetItem ( #lread ( #sl ( 0 ) , 10 ) )
      SetItem ( #lread ( #sl ( 1 ) , 12 ) )
      SetItem ( #lread ( #sl ( 2 ) , 14 ) )
      SetItem ( #lread ( #sl ( 3 ) , 16 ) )
      SetItem ( #lread ( #sl ( 4 ) , 18 ) )
      SetItem ( #lread ( #sl ( 5 ) , 26 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 11 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 13 ) )
      SetItem ( #lwrite ( #sl ( 2 ) , 15 ) )
      SetItem ( #lwrite ( #sl ( 3 ) , 17 ) )
      SetItem ( #lwrite ( #sl ( 4 ) , 19 ) )
      SetItem ( #lwrite ( #sl ( 5 ) , 27 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 1 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 2 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 3 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 4 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 5 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 5 , 1 ) |-> #ms ( 0 , 0 )
      #heap ( 5 , 2 ) |-> #ms ( 1 , 0 )
      #heap ( 5 , 3 ) |-> #ms ( 0 , 0 )
      #heap ( 5 , 4 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
      #sl ( 3 ) |-> #ms ( 0 , 0 )
      #sl ( 4 ) |-> #ms ( 0 , 0 )
      #sl ( 5 ) |-> #ms ( 0 , 0 )
      #sl ( 6 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      29
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
        var ( 0 ) |-> varInfo ( a0 , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 1 )
        var ( 1 ) |-> varInfo ( a1 , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 1 )
        var ( 2 ) |-> varInfo ( a2 , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 1 )
        var ( 3 ) |-> varInfo ( a3 , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 1 )
        var ( 4 ) |-> varInfo ( a4 , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 1 )
        var ( 5 ) |-> varInfo ( v , #owner ( #array ( #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 5 ) ) , 1 )
        var ( 6 ) |-> varInfo ( t , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 0 ) , .ExpCLs ) incl letcl var ( 1 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 1 ) , .ExpCLs ) incl letcl var ( 2 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 3 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 3 ) , .ExpCLs ) incl letcl var ( 4 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 4 ) , .ExpCLs ) incl letcl var ( 5 ) =cl #AllocateInit ( valcl ( 5 ) , #owner ( #array ( #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) , 5 ) ) , #move ( var ( 0 ) ) , #move ( var ( 1 ) ) , #move ( var ( 2 ) ) , #move ( var ( 3 ) ) , #move ( var ( 4 ) ) , .ExpCLs ) incl letcl var ( 6 ) =cl #move ( #Index ( var ( 5 ) , valcl ( 2 ) ) ) incl #print ( "{}" , #Index ( var ( 5 ) , valcl ( 2 ) ) .cl valcl ( 0 ) , .ExpCLs ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
