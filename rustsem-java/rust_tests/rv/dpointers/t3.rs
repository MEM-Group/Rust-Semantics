
fn main() {
   let y;

   {
	let x = [1,2];
	y = & x;
   }

   let t = *y;
}