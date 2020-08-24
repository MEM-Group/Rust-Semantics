

struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main() {
   let x = Box::new(23);
   let z = x;
   println!("{}", *x); //This statement cannot be executed due to x is moved
}