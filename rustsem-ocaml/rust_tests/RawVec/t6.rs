
fn main() {

   let x = [1,2];

   let y = & x as * const i32;

   unsafe{assert_eq!(#offsetr((*y),0), 1);}
   
}