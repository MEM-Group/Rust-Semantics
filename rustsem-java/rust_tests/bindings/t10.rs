
struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main() {

   let x = Box::new(12);

   let y = Box::new(34);

   let b = 4;

   let z;

   if (b == 4) {
      z = & x;
   } else {
      z = & y;
   };

   println!("{}", (* z) . data);

}