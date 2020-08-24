<T>
  <threads>
    <thread>
      <threadId>
        0
      </threadId>
      <tname>
        "main"
      </tname>
      <k>
        assertcl ( valcl ( 1 ) ) ~> #freezercomputeFunBody0_ ( ) ~> #freezercomputeFunBody0_ ( ) ~> #freezercomputeFunBody0_ ( )
      </k>
      <env>
        re |-> valcl ( V0 +Int V1 )
        x |-> valcl ( V0 )
        y |-> valcl ( V1 )
      </env>
      <clstack>
        ListItem ( re )
        ListItem ( x |-> valcl ( V0 )
        y |-> valcl ( V1 ) )
        ListItem ( y )
        ListItem ( x |-> valcl ( V0 ) )
        ListItem ( x )
        ListItem ( .Map )
      </clstack>
    </thread>
    <cntThreads>
      1
    </cntThreads>
  </threads>
  <OPContext>
    <closures>
      <closureCnt>
        V2 +Int 1
      </closureCnt>
      <funclosure>
        sum |-> V2
      </funclosure>
      <closure>
        <crId>
          V2
        </crId>
        <crContext>
          .
        </crContext>
        <crParams>
          var ( 0 ) , var ( 1 ) , .Idents
        </crParams>
        <crBody>
          (| #moveVal ( var ( 0 ) +cl var ( 1 ) , var ( 0 ) +cl var ( 1 ) ) |)
        </crBody>
      </closure>
    </closures>
    <memory>
      <memaddress>
        V3
      </memaddress>
      <blocks>
        .BlockCellBag
      </blocks>
      <memorystatus>
        .Map
      </memorystatus>
      <cntmem>
        .Map
      </cntmem>
    </memory>
  </OPContext>
  <tmpk>
    .
  </tmpk>
  <cpable>
    SetItem ( bool )
    SetItem ( i32 )
  </cpable>
  <output>
    .List
  </output>
</T>
