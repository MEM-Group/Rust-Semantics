
struct RawVec<T> {
       ptr: * mut T,
       Cap: usize
}

impl RawVec<T> {

     fn as_ptr(&self) -> * mut T{
     	let t = (*self).ptr; t
     }

     fn with_capacity(cap: usize) -> RawVec<T> {
     	RawVec {
	       ptr: #rallocate(#TyUndef,cap),
	       Cap: cap
	}     
     }
     
     fn cap(&self) -> usize {
     	(*self).Cap
     }


     fn reserve_exact(& mut self, used_cap: usize, need_extra_cap: usize){

     	if ((self.cap)() - used_cap >= need_extra_cap) {
	   return ;
	};
	let new_cap = used_cap + need_extra_cap;
	let c = (self.cap)();
	if (c == 0){
	   #rallocate(#TyUndef, new_cap);
	}else {
	   _Rust_reallocate((*self).ptr, new_cap);
	};
	(*self).Cap = new_cap;
     }

     fn double(& mut self){
        unsafe{
     	   let new_cap = 2 * ((self.cap)());
	    _Rust_reallocate((*self).ptr, new_cap);
	   (*self).Cap = new_cap;
	}
     }
     
}

fn main() {


   let r = RawVec::with_capacity(10);
   assert_eq!((&r).cap(), 10);

}
