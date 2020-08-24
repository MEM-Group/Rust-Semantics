

module VECDEQUEPUSHFRONT-SPEC

imports CLANG


rule <T>
     <threads>
       <Thread>
         <threadId> 0 </threadId>
	 <tname> "main" </tname>
	 <k>

fun main ( .Idents ) { (| letcl var ( 62 ) =cl callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , with_capacity ) , valcl ( 4 ) , .ExpCLs ) incl ( callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , push_front ) , refcl ( 1 , var ( 62 ) ) , valcl ( 7 ) , .ExpCLs ) ;cl clskip ;cl callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , push_back ) , refcl ( 1 , var ( 62 ) ) , valcl ( 71 ) , .ExpCLs ) ;cl clskip ;cl callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , push_back ) , refcl ( 1 , var ( 62 ) ) , valcl ( 6 ) , .ExpCLs ) ;cl clskip ;cl callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , push_back ) , refcl ( 1 , var ( 62 ) ) , valcl ( 61 ) , .ExpCLs ) ;cl clskip ;cl callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , push_back ) , refcl ( 1 , var ( 62 ) ) , valcl ( 62 ) , .ExpCLs ) ;cl clskip ) |) } ;cl

fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , push_back ) ( var ( 59 ) , var ( 60 ) , .Idents ) { (| callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , grow_if_necessary ) , var ( 59 ) , .ExpCLs ) ;cl clskip ;cl letcl var ( 61 ) =cl *cl na var ( 59 ) .cl valcl ( 1 ) incl ( *cl na var ( 59 ) .cl valcl ( 1 ) :=cl sc callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , wrap_add ) , var ( 59 ) , *cl na var ( 59 ) .cl valcl ( 1 ) , valcl ( 1 ) , .ExpCLs ) ;cl clskip ;cl clskip ;cl callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , buffer_write ) , var ( 59 ) , var ( 61 ) , #move ( var ( 60 ) ) , .ExpCLs ) ;cl clskip ;cl callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , buffer_write ) , var ( 59 ) , var ( 61 ) , #move ( var ( 60 ) ) , .ExpCLs ) ) |) }  ;cl

fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , push_front ) ( var ( 56 ) , var ( 57 ) , .Idents ) { (|

                 callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , grow_if_necessary ) , var ( 56 ) , .ExpCLs ) ;cl  clskip  ;cl
		 

*cl na var ( 56 ) .cl valcl ( 0 ) :=cl sc callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , wrap_sub ) , var ( 56 ) , *cl na var ( 56 ) .cl valcl ( 0 ) , valcl ( 1 ) , .ExpCLs ) ;cl clskip ;cl clskip ;cl letcl var ( 58 ) =cl *cl na var ( 56 ) .cl valcl ( 0 ) incl ( /*callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , buffer_write ) , var ( 56 ) , var ( 58 ) , #move ( var ( 57 ) ) , .ExpCLs ) ;cl*/ clskip ) |) }  ;cl

fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , buffer_write ) ( var ( 53 ) , var ( 54 ) , var ( 55 ) , .Idents ) { (| callcl ( #cpath ( #owner ( #IdTy ( ptr , #prod ( .Fields ) ) ) , write ) , callcl ( #cpath ( #raw ( #ty ( T ) ) , offset ) , callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , ptr ) , var ( 53 ) , .ExpCLs ) , var ( 54 ) , .ExpCLs ) , #move ( var ( 55 ) ) , .ExpCLs ) ;cl clskip |) }  ;cl

fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , wrap_add ) ( var ( 50 ) , var ( 51 ) , var ( 52 ) , .Idents ) { (| callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , wrap_index ) , var ( 51 ) +cl var ( 52 ) , callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , cap ) , var ( 50 ) , .ExpCLs ) , .ExpCLs ) |) }  ;cl

fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , wrap_sub ) ( var ( 47 ) , var ( 48 ) , var ( 49 ) , .Idents ) { (| callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , wrap_index ) , var ( 48 ) -cl var ( 49 ) , callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , cap ) , var ( 47 ) , .ExpCLs ) , .ExpCLs ) |) }  ;cl


fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , wrap_index ) ( var ( 45 ) , var ( 46 ) , .Idents ) { (| var ( 45 ) modcl var ( 46 ) |) }  ;cl

fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , grow_if_necessary ) ( var ( 43 ) , .Idents ) { (|

ifcl
callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , is_full ) , var ( 43 ) , .ExpCLs )
thencl (| clskip |) elsecl (|

letcl var ( 44 ) =cl  callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , cap ) , var ( 43 ) , .ExpCLs ) incl (  callcl ( #cpath ( #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , double ) , refcl ( 1 , *cl na var ( 43 ) .cl valcl ( 2 ) ) , .ExpCLs ) ;cl clskip ;cl callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , handle_cap_increase ) , var ( 43 ) , var ( 44 ) , .ExpCLs ) ;cl clskip )

|)
|) } ;cl


fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , is_full ) ( var ( 42 ) , .Idents ) { (| callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , cap ) , var ( 42 ) , .ExpCLs ) -cl callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , len ) , var ( 42 ) , .ExpCLs ) ==cl valcl ( 1 ) |) }  ;cl

fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , reserve ) ( var ( 35 ) , var ( 36 ) , .Idents ) { (| letcl var ( 37 ) =cl callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , cap ) , var ( 35 ) , .ExpCLs ) incl letcl var ( 38 ) =cl callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , len ) , var ( 35 ) , .ExpCLs ) +cl valcl ( 1 ) incl letcl var ( 39 ) =cl var ( 38 ) +cl var ( 36 ) incl letcl var ( 40 ) =cl var ( 37 ) incl ( #loop var ( 40 ) <-cl var ( 39 ) { (| var ( 40 ) :=cl var ( 40 ) *-cl valcl ( 2 ) ;cl clskip ;cl clskip |) } ;cl letcl var ( 41 ) =cl var ( 40 ) incl ifcl var ( 41 ) >-cl callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , capacity ) , var ( 35 ) , .ExpCLs ) thencl (| clskip |) elsecl (| callcl ( #cpath ( #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , reserve_exact ) , refcl ( 1 , *cl na var ( 35 ) .cl valcl ( 2 ) ) , var ( 38 ) , var ( 41 ) -cl var ( 38 ) , .ExpCLs ) ;cl clskip ;cl callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , handle_cap_increase ) , var ( 35 ) , var ( 37 ) , .ExpCLs ) ;cl clskip |) ) |) }  ;cl

fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , handle_cap_increase ) ( var ( 31 ) , var ( 32 ) , .Idents ) { (| letcl var ( 33 ) =cl callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , cap ) , var ( 31 ) , .ExpCLs ) incl ( ifcl *cl na var ( 31 ) .cl valcl ( 0 ) <=cl *cl na var ( 31 ) .cl valcl ( 1 ) thencl (| ifcl *cl na var ( 31 ) .cl valcl ( 1 ) <-cl var ( 32 ) -cl *cl na var ( 31 ) .cl valcl ( 0 ) thencl (| letcl var ( 34 ) =cl var ( 33 ) -cl ( var ( 32 ) -cl *cl na var ( 31 ) .cl valcl ( 0 ) ) incl ( /*callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , copy_nonoverlapping ) , var ( 31 ) , var ( 34 ) , *cl na var ( 31 ) .cl valcl ( 0 ) , var ( 32 ) -cl *cl na var ( 31 ) .cl valcl ( 0 ) , .ExpCLs ) ;cl */ clskip ;cl *cl na var ( 31 ) .cl valcl ( 0 ) :=cl sc var ( 34 ) ;cl clskip ;cl clskip ) |) elsecl (| /*callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , copy_nonoverlapping ) , var ( 31 ) , var ( 32 ) , valcl ( 0 ) , *cl na var ( 31 ) .cl valcl ( 1 ) , .ExpCLs ) ;cl */ clskip ;cl *cl na var ( 31 ) .cl valcl ( 1 ) :=cl sc *cl na var ( 31 ) .cl valcl ( 1 ) +cl var ( 32 ) ;cl clskip ;cl clskip |) |) elsecl (| clskip |) ;cl clskip ;cl clskip ) |) } ;cl

fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , copy_nonoverlapping ) ( var ( 27 ) , var ( 28 ) , var ( 29 ) , var ( 30 ) , .Idents ) { (| ifcl var ( 30 ) ==cl valcl ( 0 ) thencl (| callcl ( #cpath ( #owner ( #IdTy ( ptr , #prod ( .Fields ) ) ) , copy_nonoverlapping ) , callcl ( #cpath ( #raw ( #ty ( T ) ) , offset ) , callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , ptr ) , var ( 27 ) , .ExpCLs ) , var ( 29 ) , .ExpCLs ) , callcl ( #cpath ( #raw ( #ty ( T ) ) , offset ) , callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , ptr ) , var ( 27 ) , .ExpCLs ) , var ( 28 ) , .ExpCLs ) , var ( 30 ) , .ExpCLs ) ;cl clskip |) elsecl (| #retcl ( clskip ) |) |) }  ;cl

fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , len ) ( var ( 26 ) , .Idents ) { (| callcl ( count , *cl na var ( 26 ) .cl valcl ( 0 ) , *cl na var ( 26 ) .cl valcl ( 1 ) , callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , cap ) , var ( 26 ) , .ExpCLs ) , .ExpCLs ) |) } ;cl

fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , ptr ) ( var ( 25 ) , .Idents ) { (| callcl ( #cpath ( #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , as_ptr ) , refcl ( 0 , *cl na var ( 25 ) .cl valcl ( 2 ) ) , .ExpCLs ) |) }  ;cl

fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , capacity ) ( var ( 24 ) , .Idents ) { (| callcl ( #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , cap ) , var ( 24 ) , .ExpCLs ) -cl valcl ( 1 ) |) }  ;cl

fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , with_capacity ) ( var ( 22 ) , .Idents ) { (| letcl var ( 23 ) =cl var ( 22 ) incl #AllocateInit ( valcl ( 3 ) , #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) , valcl ( 0 ) , valcl ( 0 ) , callcl ( #cpath ( #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , with_capacity ) , var ( 23 ) , .ExpCLs ) , .ExpCLs ) |) }  ;cl

fun #cpath ( #owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ) , cap ) ( var ( 21 ) , .Idents ) { (| callcl ( #cpath ( #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , cap ) , refcl ( 0 , *cl na var ( 21 ) .cl valcl ( 2 ) ) , .ExpCLs ) |) } ;cl

fun count ( var ( 18 ) , var ( 19 ) , var ( 20 ) , .Idents ) { (| var ( 19 ) -cl var ( 18 ) modcl var ( 20 ) |) }  ;cl

fun #cpath ( #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , double ) ( var ( 16 ) , .Idents ) { (| letcl var ( 17 ) =cl valcl ( 2 ) *-cl callcl ( #cpath ( #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , cap ) , var ( 16 ) , .ExpCLs ) incl ( #reallocate ( *cl na var ( 16 ) .cl valcl ( 0 ) , var ( 17 ) ) ;cl clskip ;cl *cl na var ( 16 ) .cl valcl ( 1 ) :=cl sc var ( 17 ) ;cl clskip ;cl clskip ;cl clskip ) |) }  ;cl

fun #cpath ( #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , reserve_exact ) ( var ( 11 ) , var ( 12 ) , var ( 13 ) , .Idents ) { (| ifcl callcl ( #cpath ( #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , cap ) , var ( 11 ) , .ExpCLs ) -cl var ( 12 ) >=cl var ( 13 ) thencl (| clskip |) elsecl (| #retcl ( clskip ) |) ;cl clskip ;cl clskip ;cl letcl var ( 14 ) =cl var ( 12 ) +cl var ( 13 ) incl letcl var ( 15 ) =cl callcl ( #cpath ( #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , cap ) , var ( 11 ) , .ExpCLs ) incl ( ifcl var ( 15 ) ==cl valcl ( 0 ) thencl (| #reallocate ( *cl na var ( 11 ) .cl valcl ( 0 ) , var ( 14 ) ) ;cl clskip |) elsecl (| #Allocate ( var ( 14 ) , #TyUndef ) ;cl clskip |) ;cl clskip ;cl clskip ;cl *cl na var ( 11 ) .cl valcl ( 1 ) :=cl sc var ( 14 ) ;cl clskip ;cl clskip ) |) } ;cl

fun #cpath ( #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , cap ) ( var ( 10 ) , .Idents ) { (| *cl na var ( 10 ) .cl valcl ( 1 ) |) } ;cl

fun #cpath ( #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , with_capacity ) ( var ( 9 ) , .Idents ) { (| #AllocateInit ( valcl ( 2 ) , #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) , #Allocate ( var ( 9 ) , #TyUndef ) , var ( 9 ) , .ExpCLs ) |) } ;cl

fun #cpath ( #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) , as_ptr ) ( var ( 7 ) , .Idents ) { (| letcl var ( 8 ) =cl *cl na var ( 7 ) .cl valcl ( 0 ) incl var ( 8 ) |) }  ;cl

fun #cpath ( #raw ( #ty ( T ) ) , offset ) ( var ( 5 ) , var ( 6 ) , .Idents ) { (| #offset ( var ( 5 ) , var ( 6 ) ) |) } ;cl

fun #cpath ( #owner ( #IdTy ( ptr , #prod ( .Fields ) ) ) , write ) ( var ( 3 ) , var ( 4 ) , .Idents ) { (| *cl na var ( 3 ) :=cl sc #move ( var ( 4 ) ) ;cl clskip ;cl clskip |) }  ;cl fun #cpath ( #owner ( #IdTy ( ptr , #prod ( .Fields ) ) ) , copy_nonoverlapping ) ( var ( 0 ) , var ( 1 ) , var ( 2 ) , .Idents ) { (| #memcopy ( var ( 0 ) , var ( 1 ) , var ( 2 ) ) ;cl clskip |) }

;cl

callcl( #cpath(#owner ( #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , 
        #fd ( head , i32 ) , #fd ( buf ,
        #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( T ) ) ) , 
        #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) ), push_front),
        refcl(1, var ( 100001 ) ),
        valcl(SN:Int), .ExpCLs )

=>  #unit

 </k>
   <env>  var(100001) |-> #sl(0) </env>
   <clstack> .List => CLSTACK:List </clstack>
</Thread>
<activeThreads> SetItem(0) </activeThreads>
<cntThreads> 1 </cntThreads>
<cthread> 0:Int </cthread>
</threads>
   <closures>
	<closureCnt> 0 => CLOSURECNT:Int  </closureCnt>
	<funclosure> .Map => Rho:Map </funclosure>
	(.Bag => _)
   </closures>
   <memory>
    <slocAddr> 1:Int => MEMADDRESS:Int </slocAddr>
    <sloc> 0 |-> #own(#blk(2)) </sloc>
    <blkAddr> 0 => BLKAP:Int </blkAddr>
    <blocks>
	#heap(0 +Int 2,0) |-> valcl(Tail:Int => TailH:Int)
	#heap(0 +Int 2,1) |-> valcl(Head:Int => HeadH:Int)
	#heap(0 +Int 2,2) |-> #own(#blk(0 +Int 1))
        #heap(0 +Int 1,0) |-> #Raw( #heap(0, 0))
        #heap(0 +Int 1,1) |-> valcl(8 => Cap1H:Int)
	(0 +Int 2) |-> #blkInfo ( 3 , #IdTy ( VecDeque , #prod ( #fd ( tail , i32 ) , #fd ( head , i32 ) , #fd ( buf , #owner ( #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( V0 ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) ) ) , .Fields ) ) )

    	(0 +Int 1) |-> #blkInfo ( 2 , #IdTy ( RawVec , #prod ( #fd ( ptr , #raw ( #ty ( V0 ) ) ) , #fd ( Cap , i32 ) , .Fields ) ) )

	0 |-> #blkInfo(8 => Cap1H, #TyUndef)
	(#vecDequeMap(0,8 -Int 1) => BLKS:Map)
    </blocks>
    <locRW> .Set => LOCRW1:Set </locRW>
        <memStatus>
           (
	   #sl(0) |-> #ms(0,0)
	   #heap(0,0) |-> #ms(0,0)
	   #heap(1,0) |-> #ms(0,0)
	   #heap(1,1) |-> #ms(0,0)
	   #heap(2,0) |-> #ms(0,0)
	   #heap(2,1) |-> #ms(0,0)
	   #heap(2,2) |-> #ms(0,0)
           ) => MEMS:Map
	</memStatus>
	<clk> 0 => CLKN:Int </clk>
     </memory>
     <output> .List </output>
   </T>
   requires
   	    (Tail >=Int 0) andBool
   	    (Tail <Int 8) andBool
	    (Head >=Int 0) andBool
	    (Head <Int 8)
   ensures (Tail >=Int 0) andBool
   	    (Tail <Int Cap1H) andBool
	    (Head >=Int 0) andBool
	    (Head <Int Cap1H)



endmodule

