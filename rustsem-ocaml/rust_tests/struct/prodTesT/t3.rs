

struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

struct A {
       x : Box<i32>
}

struct B {
       a : A
}

fn main(){
   let a = A {x:Box::new(34)};
   let b = B {a : a};

   println!( "{}", (b.a.x).data );
}