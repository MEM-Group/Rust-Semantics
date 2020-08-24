struct ptr{}

impl ptr {

     fn copy_nonoverlapping(from:* mut T, to:* mut T, z:i32) {
        #rmemcp(from, to , z);
	#forget(from);
	#forget(to);
     }

     fn write(addr: * mut T, data: T) {
        #write( addr, data);
	#forget(addr) ;
     }

     fn read(addr: * mut T) -> #ty(T) {
        let t = #read(addr);
	#forget(addr) ;
	t
     }

}

impl #raw(#ty(T)) {

     fn offset(self, count: isize) -> * const T {
        let re = #offsetr(#selfX, count);
        #forget(#selfX);
        re
     }

}


fn main(){

   let x = #rallocate(#raw(#ty(T)),5);
   ptr::write(x,1);
   assert_eq!(1,ptr::read(x));
   ptr::write(x.offset(1),2);
   assert_eq!(2, ptr::read(x.offset(1)));

}

