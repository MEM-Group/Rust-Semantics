

struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main(){
   let x = Box::new(66);

   {
	let y = x;
	println!("{}", y.data);
   }

   //let z = x ; This statement cannot be execute
}