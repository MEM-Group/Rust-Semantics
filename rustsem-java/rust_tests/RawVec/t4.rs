
fn main() {

   let x = 3;

   let y = & x as * const i32;

   unsafe{assert_eq!(*y, 3);}
   
}