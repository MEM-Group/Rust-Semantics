
fn main() {

   let f = |x:bool| x;

   let b = true;

   if (f(b)) {
      println!("f(true) is true");
   } else {
      println!("f(false) is false");
   }

}