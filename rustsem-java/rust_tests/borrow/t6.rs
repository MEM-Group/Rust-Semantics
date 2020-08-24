
//This is a test case to test whether our semantics can detect incorrect borrowing
//The print statement cannot be executed, due to x is freed. The chain y -> x -> Box
//is crashed

struct Box < T > {
       data : T
}

impl Box {
     fn new(x:T) -> Box < T > {
     	Box{
		data: x
	}
     }
}

fn main() {

   let y;
   {
	let x = Box::new(23);
	y = & mut x;
   }
   println!("{}", (* y).data );
}