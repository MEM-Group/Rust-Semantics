
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

   let z;

   if (x.data == 22) {
      z = x;
   }
   else {
      z = Box::new(32);
   };

   println!("{}", z.data);

}