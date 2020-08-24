struct ptr{}

impl ptr {

     fn copy_nonoverlapping(from:* mut T, to:* mut T, z:i32) {
        _Rust_memcpy(from, to , z);
	#forget(from);
	#forget(to);
     }

     fn write(addr: * mut T, data: T) {
        #intrinsicWrite(addr, data);
	#forget(addr) ;
     }

     fn read(addr: * mut T) -> T {
        let t = #intrinsicRead(addr);
	#forget(addr) ;
	t
     }

}

fn main(){

   let x = #rallocate(#raw(#ty(T)),1);
   ptr::write(x,1);
   assert_eq!(1,  ptr::read(x));
   ptr::write(x,2);
   assert_eq!(2, * ptr::read(x));

}

