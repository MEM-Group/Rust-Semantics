


struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main() {

   let x = Box::new(2);
   let y = Box::new(3);

   let z;

   if (false) {
      z = y;
   }
   else {
      z = x;
   } ;

   println!("{}", z.data);
   
}