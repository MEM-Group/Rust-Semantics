
struct A{
       a:i32
}

struct B{
     b1:i32,
     b2:A
}

fn main() {
   let a = A{a:1};
   let b = B{b1:2,b2:a};

   let c = b.b2;

   let d = b.b2;
}