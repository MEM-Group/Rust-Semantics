


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

   {
	let z = x;
	assert_eq!(z.data, 23);
   }

   //in this position, the box should be freed
   
}