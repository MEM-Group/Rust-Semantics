
struct A{a:i32}


fn main() {


   let b;
   {
      let v = A{a:2};
      b = (& v) as * mut i32 ;
   }

   

   println!("{}",*b);
}