
fn main() {

   let mut x = 32;
   {
      let z = & mut x;

      * z = 23;

   }

   println!("{}", x);

}