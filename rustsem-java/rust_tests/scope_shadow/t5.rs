
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
   let y = & x;
   let x = Box::new(45);

   {
	let z = x;
   }

   println!("{}", (*y).data);

}