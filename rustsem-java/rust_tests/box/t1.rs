


struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main() {
   let x = Box::new(1);
   let z = & x;
   println!("{}", (* z).data);
}