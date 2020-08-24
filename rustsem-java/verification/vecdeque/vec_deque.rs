
/*****************Ptr*****************/

struct ptr {}

impl ptr {

     fn copy_nonoverlapping(from:& mut T, to:& mut T, z:i32) {
        _Rust_memcpy(from, to, z);        
     }

     fn write<T> (dst: * mut T, src: T) {
     	*dst = src;
     }

}

impl #raw(#ty(T)) {

     fn offset(self, count: isize) -> * const T {
     	 #offsetr(#selfX, count)
     }

}


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


struct VecDeque<T> {
       tail: usize,
       head: usize,
       buf:  RawVec<T>
}

fn count(tail:usize, head:usize, sz: usize) -> usize {
      (head - tail) mod (sz)
}

impl VecDeque<T> {

     fn cap(&self) -> usize {
     	((&((*self).buf)).cap)()
     }
     
     fn with_capacity(n:usize) -> VecDeque<T> {
     	let cap = n;
	VecDeque{
	    tail: 0,
	    head: 0,
	    buf: RawVec::with_capacity(cap)
	}
     }
     fn capacity(&self) -> usize{
     	((self.cap)()) - 1
     }


     fn ptr(&self) -> * mut T {
     	(&((*self).buf)).as_ptr()
     }


     fn len(& self) -> usize {
	count((*self).tail,(*self).head,(self.cap)())
     }

     fn copy_nonoverlapping(&self, dst: usize, src: usize, len:usize){
        if(len == 0 ) {
	       return ;
	}else {
	     	ptr::copy_nonoverlapping(
			(((self.ptr())).offset(src)),
			(((self.ptr())).offset(dst)),
			len);
	}
     }


     unsafe fn handle_cap_increase(& mut self, old_cap: usize) {

     	let new_cap = (self.cap)();
	if (*self).tail <= (*self).head {
	   
	}
	else if (*self).head < old_cap - (*self).tail {

	     self.copy_nonoverlapping(old_cap, 0 ,(*self) . head);
	     (*self).head = (*self).head + old_cap;
	}
	else {
	    let new_tail = new_cap - (old_cap - (*self).tail);
            (self.copy_nonoverlapping)(new_tail, (* self).tail, old_cap - (* self).tail);
            (*self).tail = new_tail; 
	};

     }

    fn reserve(& mut self, additional:usize) {
     	let old_cap = (self.cap)();
	let used_cap= (self.len)() + 1;
	let new_cap = used_cap + additional;
	let mut t = old_cap;

	while( t < new_cap ) {
	     t = t * 2 ;
	}
	
	let new_cap = t;

	if new_cap > ((self.capacity)()) {
	   (& mut ((*self).buf)).reserve_exact(used_cap, new_cap - used_cap);
	   (self.handle_cap_increase)(old_cap) ;
	}

     }

     fn is_full(& self) -> bool {
     	(self.cap)() - ((self.len)()) == 1
     }


     fn grow_if_necessary(& mut self) {
     	if (self.is_full)() {
	   let old_cap = (self.cap)();
	   ((& mut ((*self).buf)).double)();
	   (self.handle_cap_increase) (old_cap);
	}
     }

     fn wrap_index(index: usize, s: usize) -> usize {
     	index mod s
     }

     fn wrap_sub(&self, idx: usize, sub:usize) -> usize {
     	(self.wrap_index)(idx - sub, (self.cap)())
     }


     fn wrap_add(&self, idx: usize, add: usize) -> usize {
     	(self.wrap_index)(idx + add, (self.cap)())
     }


     fn buffer_write(& mut self, off:usize, value: T){
     	ptr::write((((self.ptr)()).offset)(off), value);
     }


     unsafe fn push_front(& mut self, value: T) {
     	 (self.grow_if_necessary)() ;
     	 (*self).tail = (self.wrap_sub)((*self).tail, 1);
	 let tail = (*self).tail;
     	 (self.buffer_write)(tail, value) ;
     }

     fn push_back(&mut self, value: T) {
        (self.grow_if_necessary)();
        let head = (*self).head;
        (*self).head = (self.wrap_add)((*self).head, 1);
	unsafe{
		(self.buffer_write)(head, value) ;
	}
    }

}

fn main() {
   let t = VecDeque::with_capacity(4);
   (& mut t).push_front(7);

   (& mut t).push_back(71);

//   (& mut t).push_back(6);
//   (& mut t).push_back(61);
//   (& mut t).push_back(62);

   (& mut t).reserve(6);

}