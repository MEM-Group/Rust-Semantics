

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

   {
	x;
   } 

  //The following cannot be execute due to x is moved
  let z = x;

}