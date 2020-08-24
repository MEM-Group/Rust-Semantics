

struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main() {
   let c = |x:Box<i32>| {let y = x; y.data} ;
   let b = Box::new(23);
   println!("{}", c(b));
}