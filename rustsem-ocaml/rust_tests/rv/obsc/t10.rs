
fn main() {

   let x = [1,2];

   let b = & mut x;

   let t = x[1]; //illegal
   
   b ;
}