
fn main() {

   let v = [1,2];
   let b = (& v) as * mut i32 ;

   let z = v;

   println!("{}",*b);
}