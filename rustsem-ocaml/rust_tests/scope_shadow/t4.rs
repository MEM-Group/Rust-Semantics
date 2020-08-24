
struct Box< T > {
       data:T
}

impl Box < T > {
     fn new(x:T) -> Box < T > {
     	Box {data:x}
     }
}

fn main() {

   let x = Box::new(1);
   {
	let x = Box::new(2);
	println!("{}", x.data);
	{
		let x = Box::new(3);
		println!("{}", x.data);
	}
   }
   println!("{}",x.data);

}