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
        #Read ( #pair ( #heap ( 0 , 0 ) , valcl ( false ) ) ) ~> clskip ~> #freezer#computeFB0_ ( )
      </k>
      <env>
        var ( 0 ) |-> #sl ( 1 )
        var ( 1 ) |-> #sl ( 0 )
      </env>
      <clstack>
        ListItem ( var ( 0 ) )
        ListItem ( #state ( clskip ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) , var ( 1 ) |-> #sl ( 0 ) ) )
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
      3
    </closureCnt>
    <funclosure>
      #cpath ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , new ) |-> 2
      #cpath ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , read ) |-> 1
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
        (| letcl var ( 1 ) =cl callcl ( #cpath ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , new ) , .ExpCLs ) incl ( callcl ( #cpath ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , read ) , refcl ( 0 , var ( 1 ) ) , .ExpCLs ) ;cl clskip ) |)
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
        (| ( *cl na var ( 0 ) .cl valcl ( 0 ) ) .cl valcl ( 0 ) ;cl clskip |)
      </crBody>
    </closure> <closure>
      <crId>
        2
      </crId>
      <crContext>
        .
      </crContext>
      <crParams>
        .Idents
      </crParams>
      <crBody>
        (| #AllocateInit ( valcl ( 2 ) , #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) , #Allocate ( valcl ( 2 ) , #TyUndef ) , valcl ( 0 ) , .ExpCLs ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      2
    </slocAddr>
    <sloc>
      0 |-> #own ( #blk ( 1 ) )
      1 |-> #shr ( 3 , 4 , #sl ( 0 ) )
    </sloc>
    <blkAddr>
      2
    </blkAddr>
    <blocks>
      #heap ( 0 , 0 ) |-> #uninit ( 0 )
      #heap ( 0 , 1 ) |-> #uninit ( 0 )
      #heap ( 1 , 0 ) |-> #Raw ( #heap ( 0 , 0 ) )
      #heap ( 1 , 1 ) |-> valcl ( 0 )
      0 |-> #blkInfo ( 2 , #TyUndef )
      1 |-> #blkInfo ( 2 , #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) )
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 1 ) . valcl ( 0 ) , 4 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #heap ( 1 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 1 , 1 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      4
    </clk>
  </memory>
  <output>
    .List
  </output>
  <TCContext>
    <varCtx>
      <varCnt>
        2
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( #selfX , #ref ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , 1 )
        var ( 1 ) |-> varInfo ( t , #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
      #cpath ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , new ) |-> fnTy ( .CoreTys ) -> #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) )
      #cpath ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , read ) |-> fnTy ( #ref ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .CoreTys ) -> #void
      RV |-> #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) )
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
        ListItem ( ( fun main ( .Idents ) { (| letcl var ( 1 ) =cl callcl ( #cpath ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , new ) , .ExpCLs ) incl ( callcl ( #cpath ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , read ) , refcl ( 0 , var ( 1 ) ) , .ExpCLs ) ;cl clskip ) |) } ;cl fun #cpath ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , read ) ( var ( 0 ) , .Idents ) { (| ( *cl na var ( 0 ) .cl valcl ( 0 ) ) .cl valcl ( 0 ) ;cl clskip |) } ) ;cl fun #cpath ( #owner ( #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , new ) ( .Idents ) { (| #AllocateInit ( valcl ( 2 ) , #IdTy ( RV , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) , #Allocate ( valcl ( 2 ) , #TyUndef ) , valcl ( 0 ) , .ExpCLs ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
