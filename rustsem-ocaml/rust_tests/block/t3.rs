
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
   let z : Box<i32>;
   {
	z = x;
   }
   println!("{}",z.data);

}
