


fn main() {


   let b;
   {
      let v = [1,2];
      b = (& v) as * mut i32 ;
   }

   

   println!("{}",*b);
}