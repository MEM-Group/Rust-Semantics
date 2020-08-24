

fn main(){

   let mut x = 12;

   let y = & mut x;

   {
	let t = & mut y;
	* * t = 52;
   }

   println!("{}", x);

}