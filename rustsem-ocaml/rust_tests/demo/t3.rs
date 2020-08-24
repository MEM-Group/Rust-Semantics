
fn main() {
   let x = Box::new(32);
   let z;
   {
	let y = & x;
	z = & y;
   }

   println!("{}", * * z);

}
