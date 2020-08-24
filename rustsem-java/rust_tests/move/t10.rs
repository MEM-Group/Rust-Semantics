
struct B{
     v: i32
}

struct A {
       b : B 
}

fn main() {
   let b = B {v:32};
   let a = A {b: b};
   let t = a.b;
   
   println!("{}", t.v);
}