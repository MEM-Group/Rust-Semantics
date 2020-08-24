
struct RawVec<T> {
       ptr: * mut T,
       Cap: usize
}

impl RawVec<T> {

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
	   #reallocater((*self).ptr, new_cap);
	};
	(*self).Cap = new_cap;
     }

     fn double(& mut self){
        unsafe{
     	   let new_cap = 2 * ((self.cap)());
	   #reallocater((*self).ptr, new_cap);
	   (*self).Cap = new_cap;
	}
     }
     
}

fn main() {


   let mut r = RawVec::with_capacity(10);

   (& mut r).reserve_exact(2,9);

}
