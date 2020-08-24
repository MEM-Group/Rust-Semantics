
struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main() {
   let x = Box::new(34);

   let y = Box::new(123);

   println!("x is {}, y:is {}", x.data, y.data );

   let t = x;
   
   let x = y;

   let y = t;
   //swap

   println!("x is {}, y:is {}", x.data, y.data );
}