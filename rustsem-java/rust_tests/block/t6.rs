
fn main() {

   let x = [1,2];
   {
	let y = x;
   }

   assert_eq!(x[0],1);

}