
fn main() {
   let y;

   {
	let x = 1;
	y = & x;
   }

   let t = *y;
}