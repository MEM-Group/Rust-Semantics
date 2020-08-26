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
        #parm ( #expTy ( var ( 1 ) , #owner ( #IdTy ( Tt , #sum ( #fd ( ea , #IdTy ( ea , #prod ( #fd ( #noName , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , #fd ( b , #IdTy ( b , #prod ( #fd ( #noName , i32 ) , .Fields ) ) ) , .Fields ) ) ) ) , z , ea ( a , .IdVals ) => { k = a ;  .Stmts } ) ~> .Stmts ~> #freezer_@->__LIB-SYNTAX1_ ( #tblockend ) ~> #endlft ~> #pmatch1 ( z , b ( i , .IdVals ) => { println! ( "{}" , i , .Exps ) ;  .Stmts } , .Arms ) ~> #freezer_@->__LIB-SYNTAX1_ ( #tmatch ( .GuardedActions ) ) ~> .Stmts ~> #freezer_@->__LIB-SYNTAX1_ ( #tblockend ) ~> #endlft ~> #freezerexpStmt0_ ( ) ~> .Stmts ~> #freezer_@->__LIB-SYNTAX1_ ( #tblockend ) ~> #tfunItem ( main ) ~> #endlft ~> .Decls
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
      0
    </cthread>
  </threads>
  <closures>
    <closureCnt>
      0
    </closureCnt>
    <funclosure>
      .Map
    </funclosure>
    .ClosureCellBag
  </closures>
  <memory>
    <slocAddr>
      0
    </slocAddr>
    <sloc>
      .Map
    </sloc>
    <blkAddr>
      0
    </blkAddr>
    <blocks>
      .Map
    </blocks>
    <locRW>
      .Set
    </locRW>
    <memStatus>
      .Map
    </memStatus>
    <clk>
      0
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
        var ( 2 ) |-> varInfo ( k , #TyUndef , 1 )
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
      A1 |-> 0
      k |-> 2
      z |-> 1
    </tcenv>
    <stackEnv>
      ListItem ( A1 |-> 0
      k |-> 2
      z |-> 1 )
      ListItem ( A1 |-> 0
      k |-> 2
      z |-> 1 )
      ListItem ( .Map )
    </stackEnv>
    <lifetime>
      <currentLft>
        3
      </currentLft>
    </lifetime>
    <desugar>
      <tstack>
        ListItem ( #tblockStart )
        ListItem ( #tmatchbegin )
        ListItem ( #tblockStart )
        ListItem ( letcl var ( 2 ) =cl #uninit ( 0 ) incl clskip )
        ListItem ( letcl var ( 1 ) =cl #AllocateInit ( valcl ( 2 ) , #IdTy ( Tt , #sum ( #fd ( ea , #IdTy ( ea , #prod ( #fd ( #noName , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , #fd ( b , #IdTy ( b , #prod ( #fd ( #noName , i32 ) , .Fields ) ) ) , .Fields ) ) , valcl ( 0 ) , #AllocateInit ( valcl ( 1 ) , #IdTy ( ea , #prod ( #fd ( #noName , #owner ( #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) ) ) , .Fields ) ) , #move ( var ( 0 ) ) , .ExpCLs ) , .ExpCLs ) incl clskip )
        ListItem ( letcl var ( 0 ) =cl #AllocateInit ( valcl ( 1 ) , #IdTy ( A , #prod ( #fd ( a , i32 ) , .Fields ) ) , valcl ( 2 ) , .ExpCLs ) incl clskip )
        ListItem ( #tblockStart )
        ListItem ( #separation )
        ListItem ( .Idents )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
