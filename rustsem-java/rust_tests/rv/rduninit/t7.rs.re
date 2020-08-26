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
        #Read ( #pair ( #sl ( 0 ) , valcl ( true ) ) ) ~> #freezer#Move1_ ( #write ( #sl ( 0 ) , #uninit ( 0 ) ) ) ~> #freezer#letcl1_ ( var ( 5 ) , clskip ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
      </k>
      <env>
        var ( 0 ) |-> #sl ( 0 )
        var ( 1 ) |-> #sl ( 1 )
      </env>
      <clstack>
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
        (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl valcl ( 5 ) incl ( (| casecl { var ( 1 ) ==cl valcl ( 1 ) -> (| letcl var ( 2 ) =cl valcl ( 1 ) incl #print ( "1" , .ValueCLs ) |) ; var ( 1 ) ==cl valcl ( 5 ) -> (| letcl var ( 3 ) =cl valcl ( 5 ) incl letcl var ( 4 ) =cl #move ( var ( 0 ) ) incl clskip |) ; valcl ( 0 ) -> (| #print ( "n" , .ValueCLs ) |) ; .GuardedActions } |) ;cl clskip ;cl clskip ;cl letcl var ( 5 ) =cl #move ( var ( 0 ) ) incl clskip ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      4
    </slocAddr>
    <sloc>
      0 |-> #uninit ( 0 )
      1 |-> valcl ( 5 )
    </sloc>
    <blkAddr>
      1
    </blkAddr>
    <blocks>
      .Map
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 0 ) , 7 ) )
      SetItem ( #lread ( #sl ( 0 ) , 10 ) )
      SetItem ( #lread ( #sl ( 1 ) , 4 ) )
      SetItem ( #lread ( #sl ( 1 ) , 5 ) )
      SetItem ( #lwrite ( #sl ( 0 ) , 8 ) )
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
      10
    </clk>
  </memory>
  <output>
    .List
  </output>
  <TCContext>
    <varCtx>
      <varCnt>
        6
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( x , #owner ( #array ( i32 , 2 ) ) , 1 )
        var ( 1 ) |-> varInfo ( y , i32 , 1 )
        var ( 2 ) |-> varInfo ( y , i32 , 4 )
        var ( 3 ) |-> varInfo ( y , i32 , 4 )
        var ( 4 ) |-> varInfo ( z , #owner ( #array ( i32 , 2 ) ) , 4 )
        var ( 5 ) |-> varInfo ( z , #owner ( #array ( i32 , 2 ) ) , 1 )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl letcl var ( 1 ) =cl valcl ( 5 ) incl ( (| casecl { var ( 1 ) ==cl valcl ( 1 ) -> (| letcl var ( 2 ) =cl valcl ( 1 ) incl #print ( "1" , .ValueCLs ) |) ; var ( 1 ) ==cl valcl ( 5 ) -> (| letcl var ( 3 ) =cl valcl ( 5 ) incl letcl var ( 4 ) =cl #move ( var ( 0 ) ) incl clskip |) ; valcl ( 0 ) -> (| #print ( "n" , .ValueCLs ) |) ; .GuardedActions } |) ;cl clskip ;cl clskip ;cl letcl var ( 5 ) =cl #move ( var ( 0 ) ) incl clskip ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
