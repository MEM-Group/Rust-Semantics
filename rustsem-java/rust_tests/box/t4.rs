
struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main() {

   let x = Box::new(false);

   let z;

   if (x.data == true) {
      z = x;
   }
   else {
      z = Box::new(true);
   };

   println!("{}", z.data);

}