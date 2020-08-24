
fn main() {

   let x ;

   {

	let y = [1,2];

	x = & y;
	
   }
   
   println!("{}",*x);
   

}