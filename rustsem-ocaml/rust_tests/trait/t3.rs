

struct RawVec < T > {
       ptr: * mut T,
       Cap: usize
}

impl RawVec <T> {

     fn new() -> RawVec<T> {
       RawVec {
         ptr: #rallocate(#TyUndef,0),
         Cap: 0
       }
     }

     fn with_capacity(cap: usize) -> RawVec<T> {
	RawVec {
            ptr: #rallocate(T, cap)
        }
     }

     fn cap(& self) -> usize {
        (*self).Cap
     }

     fn from_raw_parts(ptr1: * mut T, capacity: usize) -> RawVec< T > {
        RawVec {
               ptr : ptr1,
               Cap : capacity
        }
     }

}
struct VecT < T > {
    buf: RawVec <T>,
    Len : usize
}


impl VecT < T > {

     fn len(& self) -> usize {
	(*self). Len
     }

     fn new() -> VecT<T> {
        VecT {
            buf: RawVec::new(),
            Len: 0
        }
     }

   fn with_capacity(capacity: usize) -> VecT < T > {
        VecT {
            buf: RawVec::with_capacity(capacity),
            Len: 0
        }
     }

     fn capacity(& self) -> usize {
        ((& ((*self).buf)).cap)()
     }

     fn from_raw_parts(ptr1: * mut T, length: usize, capacity: usize) -> VecT < T > {
        VecT {
            buf: RawVec::from_raw_parts(ptr1, capacity),
            Len: length
	}
     }


}


enum Option<T>{
     None,
     Some( #ty(T) )
}

trait Iterator {
      gtype Item ;
      fn next(& mut self) -> Option<Item>;
}

struct uvector<T>{
       v: VecT < #ty(T) >,
       i: usize,
       len:usize
}

impl uvector<T> {
     fn new(v:VecT < T >, n:usize) -> uvector<T> {
     	uvector{
	   v : v,
	   i : 0,
	   len: n
	}
     }
}



impl Iterator for uvector {

    fn next(& mut self) -> Option<Item> {
       if ((*self).i >= (*self).len){
       	  Option::None
       } else {
       	  (*self).i = (*self).i + 1;
	  Option::Some(((*self).v)[((*self).i) - 1])
       }
    }
}


fn main() {

   let mut v = vec![1,2,3];
   let mut uv = uvector::new(v,3);

   let t = (& mut uv).next();

   match t {
   	 None => { println!("None",); },
	 Some(x) => {println!("{}",x);}
   };

   let t = (& mut uv).next();

   match t {
   	 None => { println!("None",); },
	 Some(x) => {println!("{}",x);}
   };

   let t = (& mut uv).next();

   match t {
   	 None => { println!("None",); },
	 Some(x) => {println!("{}",x);}
   };

   let t = (& mut uv).next();

   match t {
   	 None => { println!("None",); },
	 Some(x) => {println!("{}",x);}
   };


}








