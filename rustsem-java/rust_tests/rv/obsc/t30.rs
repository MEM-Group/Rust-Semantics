

struct A{
    a:i32,
    b:bool
}

fn main() {

   let x = A{a:1,b:true};

   let b = & mut (x.a);

   let z = & mut (x.b);

   (*b) = 2;

   (*z) = false;

   println!("{} {}", x.a, x.b);

}