
struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main (){

   let y = Box::new(34);

   {
	let y = y;
   }

   let t = y; //cannot be executed since y is moved in the scope

}