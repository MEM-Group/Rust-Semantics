

struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main() {

   let x = Box::new(2);

   { //scope A
	let y = x;
   }

   println!("{}",x); // this statement cannot be be executed, since x is moved in the scope A

}