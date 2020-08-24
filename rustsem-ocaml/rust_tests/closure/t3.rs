
struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main () {
   let newBox = | | {
       let x = Box::new(2);
       x
   };
   let k = newBox();
   println!("{}", k.data);
   
}