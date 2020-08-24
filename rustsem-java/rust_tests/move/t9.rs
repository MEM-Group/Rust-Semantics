
struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main() {

   let x = Box::new(32);

   if (x.data == 23) {
      let z = x;
   }
   else {
     println!("{}",x.data);
   }

}