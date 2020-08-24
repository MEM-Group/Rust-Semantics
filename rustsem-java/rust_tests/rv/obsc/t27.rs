
struct A{
    a:i32,
    b:bool
}

fn main() {

   let x = A{a:1,b:true};

   let b = & mut (x.a);

   let z = x . a;

   b;

}