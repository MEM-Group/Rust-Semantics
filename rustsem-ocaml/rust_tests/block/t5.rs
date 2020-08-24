
fn main() {

   let x = 10;
   {
	let x = 5;
	let y = x + 1;
	assert_eq!(y,y);
   }

   assert_eq!(x,10);

}