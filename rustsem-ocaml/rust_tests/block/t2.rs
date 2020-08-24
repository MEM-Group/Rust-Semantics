
fn main() {

   let x = 1;
   {
	let x = 2;
	{
		let x = 3;
		{
			let x = 4;
			   println!("{}",x);
		}
		   println!("{}",x);
	}
	println!("{}",x);
   }
   println!("{}",x);

}