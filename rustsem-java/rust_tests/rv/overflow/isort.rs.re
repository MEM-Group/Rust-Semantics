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
        #Read ( #pair ( #heap ( 0 , 7 ) , valcl ( true ) ) ) ~> #freezer#letcl1_ ( var ( 7 ) , callcl ( insert , var ( 4 ) , var ( 6 ) , var ( 7 ) , .ExpCLs ) ;cl clskip ;cl var ( 6 ) :=cl var ( 6 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip ) ~> #loopstart ( #loop var ( 6 ) <-cl var ( 5 ) { (| letcl var ( 7 ) =cl #Index ( *cl na var ( 4 ) , var ( 6 ) ) incl ( callcl ( insert , var ( 4 ) , var ( 6 ) , var ( 7 ) , .ExpCLs ) ;cl clskip ;cl var ( 6 ) :=cl var ( 6 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip ) |) } ) ~> clskip ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( )
      </k>
      <env>
        var ( 4 ) |-> #sl ( 1 )
        var ( 5 ) |-> #sl ( 2 )
        var ( 6 ) |-> #sl ( 3 )
        var ( 8 ) |-> #sl ( 0 )
      </env>
      <clstack>
        ListItem ( var ( 6 ) )
        ListItem ( var ( 4 ) |-> #sl ( 1 )
        var ( 5 ) |-> #sl ( 2 )
        var ( 8 ) |-> #sl ( 0 ) )
        ListItem ( var ( 5 ) )
        ListItem ( var ( 4 ) )
        ListItem ( #state ( clskip ~> #freezer#computeFB0_ ( ) ~> #freezer#computeFB0_ ( ) , var ( 8 ) |-> #sl ( 0 ) ) )
        ListItem ( var ( 8 ) )
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
      insert |-> 2
      insertion_sort |-> 1
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
        (| letcl var ( 8 ) =cl #AllocateInit ( valcl ( 7 ) , #vec ( i32 ) , valcl ( 4 ) , valcl ( 5 ) , valcl ( 6 ) , valcl ( 7 ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , .ExpCLs ) incl ( callcl ( insertion_sort , refcl ( 1 , var ( 8 ) ) , valcl ( 8 ) , .ExpCLs ) ;cl clskip ) |)
      </crBody>
    </closure> <closure>
      <crId>
        1
      </crId>
      <crContext>
        .
      </crContext>
      <crParams>
        var ( 4 ) , var ( 5 ) , .Idents
      </crParams>
      <crBody>
        (| letcl var ( 6 ) =cl valcl ( 1 ) incl ( #loop var ( 6 ) <-cl var ( 5 ) { (| letcl var ( 7 ) =cl #Index ( *cl na var ( 4 ) , var ( 6 ) ) incl ( callcl ( insert , var ( 4 ) , var ( 6 ) , var ( 7 ) , .ExpCLs ) ;cl clskip ;cl var ( 6 ) :=cl var ( 6 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip ) |) } ;cl clskip ) |)
      </crBody>
    </closure> <closure>
      <crId>
        2
      </crId>
      <crContext>
        .
      </crContext>
      <crParams>
        var ( 0 ) , var ( 1 ) , var ( 2 ) , .Idents
      </crParams>
      <crBody>
        (| letcl var ( 3 ) =cl var ( 1 ) -cl valcl ( 1 ) incl ( #loop var ( 3 ) >=cl valcl ( 0 ) { (| ifcl #Index ( *cl na var ( 0 ) , var ( 3 ) ) <=cl var ( 2 ) thencl (| clskip |) elsecl (| #break |) ;cl clskip ;cl clskip ;cl #Index ( *cl na var ( 0 ) , var ( 3 ) +cl valcl ( 1 ) ) :=cl sc #Index ( *cl na var ( 0 ) , var ( 3 ) ) ;cl clskip ;cl clskip ;cl var ( 3 ) :=cl var ( 3 ) -cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl #Index ( *cl na var ( 0 ) , var ( 3 ) +cl valcl ( 1 ) ) :=cl sc var ( 2 ) ;cl clskip ;cl clskip ) |)
      </crBody>
    </closure>
  </closures>
  <memory>
    <slocAddr>
      34
    </slocAddr>
    <sloc>
      0 |-> #own ( #blk ( 0 ) )
      1 |-> #mut ( 8 , 263 , #sl ( 0 ) )
      2 |-> valcl ( 8 )
      3 |-> valcl ( 7 )
    </sloc>
    <blkAddr>
      1
    </blkAddr>
    <blocks>
      #heap ( 0 , 0 ) |-> valcl ( 1 )
      #heap ( 0 , 1 ) |-> valcl ( 2 )
      #heap ( 0 , 2 ) |-> valcl ( 3 )
      #heap ( 0 , 3 ) |-> valcl ( 4 )
      #heap ( 0 , 4 ) |-> valcl ( 5 )
      #heap ( 0 , 5 ) |-> valcl ( 6 )
      #heap ( 0 , 6 ) |-> valcl ( 7 )
      0 |-> #blkInfo ( 7 , #vec ( i32 ) )
    </blocks>
    <locRW>
      SetItem ( #lread ( #sl ( 1 ) , 13 ) )
      SetItem ( #lread ( #sl ( 1 ) , 16 ) )
      SetItem ( #lread ( #sl ( 1 ) , 35 ) )
      SetItem ( #lread ( #sl ( 1 ) , 38 ) )
      SetItem ( #lread ( #sl ( 1 ) , 57 ) )
      SetItem ( #lread ( #sl ( 1 ) , 60 ) )
      SetItem ( #lread ( #sl ( 1 ) , 79 ) )
      SetItem ( #lread ( #sl ( 1 ) , 82 ) )
      SetItem ( #lread ( #sl ( 1 ) , 138 ) )
      SetItem ( #lread ( #sl ( 1 ) , 141 ) )
      SetItem ( #lread ( #sl ( 1 ) , 200 ) )
      SetItem ( #lread ( #sl ( 1 ) , 203 ) )
      SetItem ( #lread ( #sl ( 1 ) , 262 ) )
      SetItem ( #lread ( #sl ( 2 ) , 11 ) )
      SetItem ( #lread ( #sl ( 2 ) , 33 ) )
      SetItem ( #lread ( #sl ( 2 ) , 55 ) )
      SetItem ( #lread ( #sl ( 2 ) , 77 ) )
      SetItem ( #lread ( #sl ( 2 ) , 136 ) )
      SetItem ( #lread ( #sl ( 2 ) , 198 ) )
      SetItem ( #lread ( #sl ( 2 ) , 260 ) )
      SetItem ( #lread ( #sl ( 3 ) , 12 ) )
      SetItem ( #lread ( #sl ( 3 ) , 13 ) )
      SetItem ( #lread ( #sl ( 3 ) , 17 ) )
      SetItem ( #lread ( #sl ( 3 ) , 31 ) )
      SetItem ( #lread ( #sl ( 3 ) , 34 ) )
      SetItem ( #lread ( #sl ( 3 ) , 35 ) )
      SetItem ( #lread ( #sl ( 3 ) , 39 ) )
      SetItem ( #lread ( #sl ( 3 ) , 53 ) )
      SetItem ( #lread ( #sl ( 3 ) , 56 ) )
      SetItem ( #lread ( #sl ( 3 ) , 57 ) )
      SetItem ( #lread ( #sl ( 3 ) , 61 ) )
      SetItem ( #lread ( #sl ( 3 ) , 75 ) )
      SetItem ( #lread ( #sl ( 3 ) , 78 ) )
      SetItem ( #lread ( #sl ( 3 ) , 79 ) )
      SetItem ( #lread ( #sl ( 3 ) , 83 ) )
      SetItem ( #lread ( #sl ( 3 ) , 134 ) )
      SetItem ( #lread ( #sl ( 3 ) , 137 ) )
      SetItem ( #lread ( #sl ( 3 ) , 138 ) )
      SetItem ( #lread ( #sl ( 3 ) , 142 ) )
      SetItem ( #lread ( #sl ( 3 ) , 196 ) )
      SetItem ( #lread ( #sl ( 3 ) , 199 ) )
      SetItem ( #lread ( #sl ( 3 ) , 200 ) )
      SetItem ( #lread ( #sl ( 3 ) , 204 ) )
      SetItem ( #lread ( #sl ( 3 ) , 258 ) )
      SetItem ( #lread ( #sl ( 3 ) , 261 ) )
      SetItem ( #lread ( #sl ( 3 ) , 262 ) )
      SetItem ( #lread ( #sl ( 4 ) , 18 ) )
      SetItem ( #lread ( #sl ( 5 ) , 26 ) )
      SetItem ( #lread ( #sl ( 6 ) , 22 ) )
      SetItem ( #lread ( #sl ( 7 ) , 25 ) )
      SetItem ( #lread ( #sl ( 7 ) , 28 ) )
      SetItem ( #lread ( #sl ( 8 ) , 24 ) )
      SetItem ( #lread ( #sl ( 8 ) , 26 ) )
      SetItem ( #lread ( #sl ( 8 ) , 29 ) )
      SetItem ( #lread ( #sl ( 9 ) , 40 ) )
      SetItem ( #lread ( #sl ( 10 ) , 48 ) )
      SetItem ( #lread ( #sl ( 11 ) , 44 ) )
      SetItem ( #lread ( #sl ( 12 ) , 47 ) )
      SetItem ( #lread ( #sl ( 12 ) , 50 ) )
      SetItem ( #lread ( #sl ( 13 ) , 46 ) )
      SetItem ( #lread ( #sl ( 13 ) , 48 ) )
      SetItem ( #lread ( #sl ( 13 ) , 51 ) )
      SetItem ( #lread ( #sl ( 14 ) , 62 ) )
      SetItem ( #lread ( #sl ( 15 ) , 70 ) )
      SetItem ( #lread ( #sl ( 16 ) , 66 ) )
      SetItem ( #lread ( #sl ( 17 ) , 69 ) )
      SetItem ( #lread ( #sl ( 17 ) , 72 ) )
      SetItem ( #lread ( #sl ( 18 ) , 68 ) )
      SetItem ( #lread ( #sl ( 18 ) , 70 ) )
      SetItem ( #lread ( #sl ( 18 ) , 73 ) )
      SetItem ( #lread ( #sl ( 19 ) , 84 ) )
      SetItem ( #lread ( #sl ( 20 ) , 92 ) )
      SetItem ( #lread ( #sl ( 20 ) , 94 ) )
      SetItem ( #lread ( #sl ( 20 ) , 102 ) )
      SetItem ( #lread ( #sl ( 20 ) , 104 ) )
      SetItem ( #lread ( #sl ( 20 ) , 112 ) )
      SetItem ( #lread ( #sl ( 20 ) , 114 ) )
      SetItem ( #lread ( #sl ( 20 ) , 122 ) )
      SetItem ( #lread ( #sl ( 20 ) , 124 ) )
      SetItem ( #lread ( #sl ( 21 ) , 88 ) )
      SetItem ( #lread ( #sl ( 22 ) , 91 ) )
      SetItem ( #lread ( #sl ( 22 ) , 101 ) )
      SetItem ( #lread ( #sl ( 22 ) , 111 ) )
      SetItem ( #lread ( #sl ( 22 ) , 121 ) )
      SetItem ( #lread ( #sl ( 22 ) , 131 ) )
      SetItem ( #lread ( #sl ( 23 ) , 90 ) )
      SetItem ( #lread ( #sl ( 23 ) , 92 ) )
      SetItem ( #lread ( #sl ( 23 ) , 94 ) )
      SetItem ( #lread ( #sl ( 23 ) , 96 ) )
      SetItem ( #lread ( #sl ( 23 ) , 98 ) )
      SetItem ( #lread ( #sl ( 23 ) , 100 ) )
      SetItem ( #lread ( #sl ( 23 ) , 102 ) )
      SetItem ( #lread ( #sl ( 23 ) , 104 ) )
      SetItem ( #lread ( #sl ( 23 ) , 106 ) )
      SetItem ( #lread ( #sl ( 23 ) , 108 ) )
      SetItem ( #lread ( #sl ( 23 ) , 110 ) )
      SetItem ( #lread ( #sl ( 23 ) , 112 ) )
      SetItem ( #lread ( #sl ( 23 ) , 114 ) )
      SetItem ( #lread ( #sl ( 23 ) , 116 ) )
      SetItem ( #lread ( #sl ( 23 ) , 118 ) )
      SetItem ( #lread ( #sl ( 23 ) , 120 ) )
      SetItem ( #lread ( #sl ( 23 ) , 122 ) )
      SetItem ( #lread ( #sl ( 23 ) , 124 ) )
      SetItem ( #lread ( #sl ( 23 ) , 126 ) )
      SetItem ( #lread ( #sl ( 23 ) , 128 ) )
      SetItem ( #lread ( #sl ( 23 ) , 130 ) )
      SetItem ( #lread ( #sl ( 23 ) , 132 ) )
      SetItem ( #lread ( #sl ( 24 ) , 143 ) )
      SetItem ( #lread ( #sl ( 25 ) , 151 ) )
      SetItem ( #lread ( #sl ( 25 ) , 153 ) )
      SetItem ( #lread ( #sl ( 25 ) , 161 ) )
      SetItem ( #lread ( #sl ( 25 ) , 163 ) )
      SetItem ( #lread ( #sl ( 25 ) , 171 ) )
      SetItem ( #lread ( #sl ( 25 ) , 173 ) )
      SetItem ( #lread ( #sl ( 25 ) , 181 ) )
      SetItem ( #lread ( #sl ( 25 ) , 183 ) )
      SetItem ( #lread ( #sl ( 25 ) , 191 ) )
      SetItem ( #lread ( #sl ( 26 ) , 147 ) )
      SetItem ( #lread ( #sl ( 27 ) , 150 ) )
      SetItem ( #lread ( #sl ( 27 ) , 160 ) )
      SetItem ( #lread ( #sl ( 27 ) , 170 ) )
      SetItem ( #lread ( #sl ( 27 ) , 180 ) )
      SetItem ( #lread ( #sl ( 27 ) , 190 ) )
      SetItem ( #lread ( #sl ( 27 ) , 193 ) )
      SetItem ( #lread ( #sl ( 28 ) , 149 ) )
      SetItem ( #lread ( #sl ( 28 ) , 151 ) )
      SetItem ( #lread ( #sl ( 28 ) , 153 ) )
      SetItem ( #lread ( #sl ( 28 ) , 155 ) )
      SetItem ( #lread ( #sl ( 28 ) , 157 ) )
      SetItem ( #lread ( #sl ( 28 ) , 159 ) )
      SetItem ( #lread ( #sl ( 28 ) , 161 ) )
      SetItem ( #lread ( #sl ( 28 ) , 163 ) )
      SetItem ( #lread ( #sl ( 28 ) , 165 ) )
      SetItem ( #lread ( #sl ( 28 ) , 167 ) )
      SetItem ( #lread ( #sl ( 28 ) , 169 ) )
      SetItem ( #lread ( #sl ( 28 ) , 171 ) )
      SetItem ( #lread ( #sl ( 28 ) , 173 ) )
      SetItem ( #lread ( #sl ( 28 ) , 175 ) )
      SetItem ( #lread ( #sl ( 28 ) , 177 ) )
      SetItem ( #lread ( #sl ( 28 ) , 179 ) )
      SetItem ( #lread ( #sl ( 28 ) , 181 ) )
      SetItem ( #lread ( #sl ( 28 ) , 183 ) )
      SetItem ( #lread ( #sl ( 28 ) , 185 ) )
      SetItem ( #lread ( #sl ( 28 ) , 187 ) )
      SetItem ( #lread ( #sl ( 28 ) , 189 ) )
      SetItem ( #lread ( #sl ( 28 ) , 191 ) )
      SetItem ( #lread ( #sl ( 28 ) , 194 ) )
      SetItem ( #lread ( #sl ( 29 ) , 205 ) )
      SetItem ( #lread ( #sl ( 30 ) , 213 ) )
      SetItem ( #lread ( #sl ( 30 ) , 215 ) )
      SetItem ( #lread ( #sl ( 30 ) , 223 ) )
      SetItem ( #lread ( #sl ( 30 ) , 225 ) )
      SetItem ( #lread ( #sl ( 30 ) , 233 ) )
      SetItem ( #lread ( #sl ( 30 ) , 235 ) )
      SetItem ( #lread ( #sl ( 30 ) , 243 ) )
      SetItem ( #lread ( #sl ( 30 ) , 245 ) )
      SetItem ( #lread ( #sl ( 30 ) , 253 ) )
      SetItem ( #lread ( #sl ( 31 ) , 209 ) )
      SetItem ( #lread ( #sl ( 32 ) , 212 ) )
      SetItem ( #lread ( #sl ( 32 ) , 222 ) )
      SetItem ( #lread ( #sl ( 32 ) , 232 ) )
      SetItem ( #lread ( #sl ( 32 ) , 242 ) )
      SetItem ( #lread ( #sl ( 32 ) , 252 ) )
      SetItem ( #lread ( #sl ( 32 ) , 255 ) )
      SetItem ( #lread ( #sl ( 33 ) , 211 ) )
      SetItem ( #lread ( #sl ( 33 ) , 213 ) )
      SetItem ( #lread ( #sl ( 33 ) , 215 ) )
      SetItem ( #lread ( #sl ( 33 ) , 217 ) )
      SetItem ( #lread ( #sl ( 33 ) , 219 ) )
      SetItem ( #lread ( #sl ( 33 ) , 221 ) )
      SetItem ( #lread ( #sl ( 33 ) , 223 ) )
      SetItem ( #lread ( #sl ( 33 ) , 225 ) )
      SetItem ( #lread ( #sl ( 33 ) , 227 ) )
      SetItem ( #lread ( #sl ( 33 ) , 229 ) )
      SetItem ( #lread ( #sl ( 33 ) , 231 ) )
      SetItem ( #lread ( #sl ( 33 ) , 233 ) )
      SetItem ( #lread ( #sl ( 33 ) , 235 ) )
      SetItem ( #lread ( #sl ( 33 ) , 237 ) )
      SetItem ( #lread ( #sl ( 33 ) , 239 ) )
      SetItem ( #lread ( #sl ( 33 ) , 241 ) )
      SetItem ( #lread ( #sl ( 33 ) , 243 ) )
      SetItem ( #lread ( #sl ( 33 ) , 245 ) )
      SetItem ( #lread ( #sl ( 33 ) , 247 ) )
      SetItem ( #lread ( #sl ( 33 ) , 249 ) )
      SetItem ( #lread ( #sl ( 33 ) , 251 ) )
      SetItem ( #lread ( #sl ( 33 ) , 253 ) )
      SetItem ( #lread ( #sl ( 33 ) , 256 ) )
      SetItem ( #lwrite ( #sl ( 3 ) , 32 ) )
      SetItem ( #lwrite ( #sl ( 3 ) , 54 ) )
      SetItem ( #lwrite ( #sl ( 3 ) , 76 ) )
      SetItem ( #lwrite ( #sl ( 3 ) , 135 ) )
      SetItem ( #lwrite ( #sl ( 3 ) , 197 ) )
      SetItem ( #lwrite ( #sl ( 3 ) , 259 ) )
      SetItem ( #lwrite ( #sl ( 5 ) , 29 ) )
      SetItem ( #lwrite ( #sl ( 10 ) , 51 ) )
      SetItem ( #lwrite ( #sl ( 15 ) , 73 ) )
      SetItem ( #lwrite ( #sl ( 20 ) , 96 ) )
      SetItem ( #lwrite ( #sl ( 20 ) , 106 ) )
      SetItem ( #lwrite ( #sl ( 20 ) , 116 ) )
      SetItem ( #lwrite ( #sl ( 20 ) , 126 ) )
      SetItem ( #lwrite ( #sl ( 20 ) , 132 ) )
      SetItem ( #lwrite ( #sl ( 23 ) , 99 ) )
      SetItem ( #lwrite ( #sl ( 23 ) , 109 ) )
      SetItem ( #lwrite ( #sl ( 23 ) , 119 ) )
      SetItem ( #lwrite ( #sl ( 23 ) , 129 ) )
      SetItem ( #lwrite ( #sl ( 25 ) , 155 ) )
      SetItem ( #lwrite ( #sl ( 25 ) , 165 ) )
      SetItem ( #lwrite ( #sl ( 25 ) , 175 ) )
      SetItem ( #lwrite ( #sl ( 25 ) , 185 ) )
      SetItem ( #lwrite ( #sl ( 25 ) , 194 ) )
      SetItem ( #lwrite ( #sl ( 28 ) , 158 ) )
      SetItem ( #lwrite ( #sl ( 28 ) , 168 ) )
      SetItem ( #lwrite ( #sl ( 28 ) , 178 ) )
      SetItem ( #lwrite ( #sl ( 28 ) , 188 ) )
      SetItem ( #lwrite ( #sl ( 30 ) , 217 ) )
      SetItem ( #lwrite ( #sl ( 30 ) , 227 ) )
      SetItem ( #lwrite ( #sl ( 30 ) , 237 ) )
      SetItem ( #lwrite ( #sl ( 30 ) , 247 ) )
      SetItem ( #lwrite ( #sl ( 30 ) , 256 ) )
      SetItem ( #lwrite ( #sl ( 33 ) , 220 ) )
      SetItem ( #lwrite ( #sl ( 33 ) , 230 ) )
      SetItem ( #lwrite ( #sl ( 33 ) , 240 ) )
      SetItem ( #lwrite ( #sl ( 33 ) , 250 ) )
    </locRW>
    <memStatus>
      #heap ( 0 , 0 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 1 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 2 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 3 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 4 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 5 ) |-> #ms ( 0 , 0 )
      #heap ( 0 , 6 ) |-> #ms ( 0 , 0 )
      #sl ( 0 ) |-> #ms ( 0 , 0 )
      #sl ( 1 ) |-> #ms ( 0 , 0 )
      #sl ( 2 ) |-> #ms ( 0 , 0 )
      #sl ( 3 ) |-> #ms ( 0 , 0 )
      #sl ( 4 ) |-> #ms ( 0 , 0 )
      #sl ( 5 ) |-> #ms ( 0 , 0 )
      #sl ( 6 ) |-> #ms ( 0 , 0 )
      #sl ( 7 ) |-> #ms ( 0 , 0 )
      #sl ( 8 ) |-> #ms ( 0 , 0 )
      #sl ( 9 ) |-> #ms ( 0 , 0 )
      #sl ( 10 ) |-> #ms ( 0 , 0 )
      #sl ( 11 ) |-> #ms ( 0 , 0 )
      #sl ( 12 ) |-> #ms ( 0 , 0 )
      #sl ( 13 ) |-> #ms ( 0 , 0 )
      #sl ( 14 ) |-> #ms ( 0 , 0 )
      #sl ( 15 ) |-> #ms ( 0 , 0 )
      #sl ( 16 ) |-> #ms ( 0 , 0 )
      #sl ( 17 ) |-> #ms ( 0 , 0 )
      #sl ( 18 ) |-> #ms ( 0 , 0 )
      #sl ( 19 ) |-> #ms ( 0 , 0 )
      #sl ( 20 ) |-> #ms ( 0 , 0 )
      #sl ( 21 ) |-> #ms ( 0 , 0 )
      #sl ( 22 ) |-> #ms ( 0 , 0 )
      #sl ( 23 ) |-> #ms ( 0 , 0 )
      #sl ( 24 ) |-> #ms ( 0 , 0 )
      #sl ( 25 ) |-> #ms ( 0 , 0 )
      #sl ( 26 ) |-> #ms ( 0 , 0 )
      #sl ( 27 ) |-> #ms ( 0 , 0 )
      #sl ( 28 ) |-> #ms ( 0 , 0 )
      #sl ( 29 ) |-> #ms ( 0 , 0 )
      #sl ( 30 ) |-> #ms ( 0 , 0 )
      #sl ( 31 ) |-> #ms ( 0 , 0 )
      #sl ( 32 ) |-> #ms ( 0 , 0 )
      #sl ( 33 ) |-> #ms ( 0 , 0 )
    </memStatus>
    <clk>
      263
    </clk>
  </memory>
  <output>
    .List
  </output>
  <TCContext>
    <varCtx>
      <varCnt>
        9
      </varCnt>
      <vInfo>
        var ( 0 ) |-> varInfo ( v , #ref ( #owner ( #vec ( i32 ) ) ) , 1 )
        var ( 1 ) |-> varInfo ( pos , i32 , 1 )
        var ( 2 ) |-> varInfo ( value , i32 , 1 )
        var ( 3 ) |-> varInfo ( pos , i32 , 1 )
        var ( 4 ) |-> varInfo ( v , #ref ( #owner ( #vec ( i32 ) ) ) , 1 )
        var ( 5 ) |-> varInfo ( len , i32 , 1 )
        var ( 6 ) |-> varInfo ( i , i32 , 1 )
        var ( 7 ) |-> varInfo ( value , i32 , 2 )
        var ( 8 ) |-> varInfo ( v , #owner ( #vec ( i32 ) ) , 1 )
      </vInfo>
    </varCtx>
    <typeCtx>
      insert |-> fnTy ( #ref ( #owner ( #vec ( i32 ) ) ) , i32 , i32 , .CoreTys ) -> #void
      insertion_sort |-> fnTy ( #ref ( #owner ( #vec ( i32 ) ) ) , i32 , .CoreTys ) -> #void
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
        ListItem ( ( fun main ( .Idents ) { (| letcl var ( 8 ) =cl #AllocateInit ( valcl ( 7 ) , #vec ( i32 ) , valcl ( 4 ) , valcl ( 5 ) , valcl ( 6 ) , valcl ( 7 ) , valcl ( 1 ) , valcl ( 2 ) , valcl ( 3 ) , .ExpCLs ) incl ( callcl ( insertion_sort , refcl ( 1 , var ( 8 ) ) , valcl ( 8 ) , .ExpCLs ) ;cl clskip ) |) } ;cl fun insertion_sort ( var ( 4 ) , var ( 5 ) , .Idents ) { (| letcl var ( 6 ) =cl valcl ( 1 ) incl ( #loop var ( 6 ) <-cl var ( 5 ) { (| letcl var ( 7 ) =cl #Index ( *cl na var ( 4 ) , var ( 6 ) ) incl ( callcl ( insert , var ( 4 ) , var ( 6 ) , var ( 7 ) , .ExpCLs ) ;cl clskip ;cl var ( 6 ) :=cl var ( 6 ) +cl valcl ( 1 ) ;cl clskip ;cl clskip ) |) } ;cl clskip ) |) } ) ;cl fun insert ( var ( 0 ) , var ( 1 ) , var ( 2 ) , .Idents ) { (| letcl var ( 3 ) =cl var ( 1 ) -cl valcl ( 1 ) incl ( #loop var ( 3 ) >=cl valcl ( 0 ) { (| ifcl #Index ( *cl na var ( 0 ) , var ( 3 ) ) <=cl var ( 2 ) thencl (| clskip |) elsecl (| #break |) ;cl clskip ;cl clskip ;cl #Index ( *cl na var ( 0 ) , var ( 3 ) +cl valcl ( 1 ) ) :=cl sc #Index ( *cl na var ( 0 ) , var ( 3 ) ) ;cl clskip ;cl clskip ;cl var ( 3 ) :=cl var ( 3 ) -cl valcl ( 1 ) ;cl clskip ;cl clskip |) } ;cl #Index ( *cl na var ( 0 ) , var ( 3 ) +cl valcl ( 1 ) ) :=cl sc var ( 2 ) ;cl clskip ;cl clskip ) |) } )
      </tstack>
      <closureId>
        0
      </closureId>
    </desugar>
  </TCContext>
</generatedTop>
