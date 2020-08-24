
struct A{a:i32}


fn main() {


   let b;
   {
      let v = 6;
      b = (& v) as * mut i32 ;
   }

   

   println!("{}",*b);
}