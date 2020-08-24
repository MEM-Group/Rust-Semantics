
fn main() {

   let x = true;

   let y = & x as * const i32;

   unsafe{assert_eq!(*y, true);}
   
}