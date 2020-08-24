
struct A{a:i32}


fn main() {

   let v = A{a:2};
   let b = (& v) as * mut i32 ;

   let z = v;

   println!("{}",*b);
}