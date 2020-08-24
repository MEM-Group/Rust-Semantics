
struct A{
    a: i32
}

fn main() {

   let y = A {a:2} ;
   
   let mut b = 5;
   
   let c = move |p:i32| {
       let z = y;
       let t = z.a + p + b;
       t
   };
   
   b = 7;
   
   assert_eq!(c(5),12);
  
}