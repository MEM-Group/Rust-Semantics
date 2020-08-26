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
        #Read ( #pair ( #sl ( 1 ) , valcl ( true ) ) ) ~> #freezer#Move1_ ( #write ( #sl ( 1 ) , #uninit ( 0 ) ) ) ~> #freezer#letcl1_ ( var ( 3 ) , clskip ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
      </k>
      <env>
        var ( 1 ) |-> #sl ( 1 )
        var ( 2 ) |-> #sl ( 2 )
      </env>
      <clstack>
        ListItem ( var ( 2 ) )
        ListItem ( var ( 1 ) |-> #sl ( 1 ) )
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
      #cpath ( #owner ( #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) ) ) , new ) |-> 1
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
        (| letcl var ( 1 ) =cl callcl ( #cpath ( #owner ( #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) ) ) , new ) , valcl ( 1 ) , .ExpCLs ) incl letcl var ( 2 ) =cl #move ( var ( 1 ) ) incl letcl var ( 3 ) =cl #move ( var ( 1 ) ) incl clskip |)
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
        (| #AllocateInit ( valcl ( 1 ) , #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) ) , #move ( var ( 0 ) ) , .ExpCLs ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      3
    </slocAddr>
    <sloc>
      1 |-> #uninit ( 0 )
      2 |-> #own ( #blk ( 0 ) )
    </sloc>
    <blkAddr>
      1
    </blkAddr>
    <blocks>
      #heap ( 0 , 0 ) |-> valcl ( 1 )
      0 |-> #blkInfo ( 1 , #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) ) )
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 0 ) , 1 ) )
      SetItem ( #lread ( #sl ( 1 ) , 4 ) )
      SetItem ( #lread ( #sl ( 1 ) , 7 ) )
      SetItem ( #lwrite ( #sl ( 1 ) , 5 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
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
        4
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( x , #ty ( T ) , 1 )
        var ( 1 ) |-> varInfo ( b , #owner ( #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) ) ) , 1 )
        var ( 2 ) |-> varInfo ( v , #owner ( #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) ) ) , 1 )
        var ( 3 ) |-> varInfo ( z , #owner ( #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) ) ) , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
      #cpath ( #owner ( #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) ) ) , new ) |-> fnTy ( #ty ( T ) , .CoreTys ) -> #owner ( #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) ) )
      Box |-> #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) )
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
        ListItem ( fun main ( .Idents ) { (| letcl var ( 1 ) =cl callcl ( #cpath ( #owner ( #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) ) ) , new ) , valcl ( 1 ) , .ExpCLs ) incl letcl var ( 2 ) =cl #move ( var ( 1 ) ) incl letcl var ( 3 ) =cl #move ( var ( 1 ) ) incl clskip |) } ;cl fun #cpath ( #owner ( #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) ) ) , new ) ( var ( 0 ) , .Idents ) { (| #AllocateInit ( valcl ( 1 ) , #IdTy ( Box , #prod ( #fd ( data , #ty ( T ) ) , .Fields ) ) , #move ( var ( 0 ) ) , .ExpCLs ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
