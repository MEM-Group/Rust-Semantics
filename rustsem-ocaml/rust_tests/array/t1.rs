

impl [i32 ; 5] {
     fn as_ptr(& self) -> * const i32 {
     	self as * const i32
     }

     fn as_mut_ptr(& self) -> * mut i32 {
     	self as * mut i32
     }
}

fn main() {

   let x = [1,2,3,4,5] ;
   
   let t = ((& imm x).as_ptr());

   (* t). 0 = 11;

   assert_eq!((*t). 0,11);
}