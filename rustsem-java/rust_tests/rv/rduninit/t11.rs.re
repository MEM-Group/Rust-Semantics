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
        var ( 0 ) |-> #sl ( 0 )
      </env>
      <clstack>
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
        (| letcl var ( 0 ) =cl #uninit ( 0 ) incl ( ifcl valcl ( 0 ) thencl (| letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl ( var ( 0 ) :=cl #move ( var ( 1 ) ) ;cl clskip ;cl clskip ) |) elsecl (| clskip |) ;cl clskip ;cl clskip ;cl letcl var ( 2 ) =cl #move ( var ( 0 ) ) incl clskip ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      1
    </slocAddr>
    <sloc>
      0 |-> #uninit ( 0 )
    </sloc>
    <blkAddr>
      0
    </blkAddr>
    <blocks>
      .Map
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 0 ) , 1 ) )
    </locRW>
    <memStatus>
      #sl ( 0 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      1
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
        var ( 0 ) |-> varInfo ( x , #owner ( #array ( i32 , 2 ) ) , 1 )
        var ( 1 ) |-> varInfo ( t , #owner ( #array ( i32 , 2 ) ) , 2 )
        var ( 2 ) |-> varInfo ( z , #owner ( #array ( i32 , 2 ) ) , 1 )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 0 ) =cl #uninit ( 0 ) incl ( ifcl valcl ( 0 ) thencl (| letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #owner ( #array ( i32 , 2 ) ) , valcl ( 1 ) , valcl ( 2 ) , .ExpCLs ) incl ( var ( 0 ) :=cl #move ( var ( 1 ) ) ;cl clskip ;cl clskip ) |) elsecl (| clskip |) ;cl clskip ;cl clskip ;cl letcl var ( 2 ) =cl #move ( var ( 0 ) ) incl clskip ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
